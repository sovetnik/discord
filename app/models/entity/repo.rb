# frozen_string_literal: true
module Entity
  class Repo < Layers::Repo
    self.table_name = 'entities'
    acts_as_tree dependent: :destroy, order: 'sort_order'

    belongs_to :abstract, class_name: 'Repo'
    has_many :examples, class_name: 'Repo', foreign_key: 'abstract_id', dependent: :destroy

    scope :abilities, -> { where(kind: 'Ability') }
    scope :axioms, -> { where(kind: 'Axiom') }
    scope :contexts, -> { where(kind: 'Context') }
    scope :inferences, -> { where(kind: 'Inference') }
    scope :layers, -> { where(kind: 'Layer') }
    scope :models, -> { where(kind: 'Model') }
    scope :examples, -> { where(kind: 'Example') }
    scope :stocks, -> { where(kind: 'Stock') }
    scope :stories, -> { where(kind: 'Story') }

    after_commit :try_update_context_tree, on: [:create, :update]

    def presenter
      Presenter.new self, producer
    end

    def producer
      Producer.wrap(self)
    end

    def title
      abstract.nil? ? name : abstract.name
    end

    def abstract_layer_name
      abstract&.parent&.name
    end

    def possibly_kinds
      return ['Domain'] if parent_id.nil?
      Entity::KINDS & parent.producer.child_kinds
    end

    def possibly_child_kinds
      Entity::KINDS & producer.child_kinds
    end

    def possibly_abstract_list
      parent.siblings.where(kind: producer.abstract_kind)
    end

    def kinds_list
      possibly_kinds.map.with_index { |obj, index| [index, obj] }
    end

    def child_kinds_list
      possibly_child_kinds.map.with_index { |obj, index| [index, obj] }
    end

    ## Possible values to collection select & validation
    def parents_list
      root.self_and_descendants
    end

    def add_child(params)
      child = children.build(params)
      child.kind_num = params[:kind_num]
      child.save
      child.try_update_context_tree
      child
    end

    ## kind num getter
    def kind_num
      possibly_kinds.rindex kind
    end

    ## kind setter by num
    def kind_num=(num)
      self.kind = kind_by_num(num)
    end

    def kind_by_num(num)
      possibly_kinds[num.to_i] || 'Story'
    end

    def try_update_context_tree
      case kind
      when 'Axiom'
        ancestors.abilities.first&.producer&.update_context_tree!
      when 'Inference'
        producer.axioms.each do |axiom|
          axiom.parent.producer.update_context_tree!
        end
      when 'Example'
        ancestors.abilities.first.producer.update_context_tree!
      end
    end
  end
end
