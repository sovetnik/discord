# frozen_string_literal: true
module Entity
  class Repo < Layers::Repo
    self.table_name = 'entities'
    acts_as_tree order: 'sort_order'

    belongs_to :abstract, class_name: 'Repo'

    scope :abilities, -> { where(kind: 'Ability') }
    scope :layers, -> { where(kind: 'Layer') }
    scope :stocks, -> { where(kind: 'Stock') }
    scope :stories, -> { where(kind: 'Story') }
    scope :axioms, -> { where(kind: 'Axiom') }
    scope :inferences, -> { where(kind: 'Inference') }

    def producer
      Producer.new self
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
      root.descendants.where(kind: producer.abstract_kind)
    end

    def kinds_list
      possibly_kinds.map.with_index { |obj, index| [index, obj] }
    end

    def child_kinds_list
      possibly_child_kinds.map.with_index { |obj, index| [index, obj] }
    end

    ## Possible values to collection select & validation
    def parents_list
      self.class.all
    end

    def add_child(params)
      child = children.build(params)
      child.kind_num = params[:kind_num]
      child.save
      child
    end

    ## kind num getter
    def kind_num
      possibly_kinds.rindex kind
    end

    ## kind setter by num
    def kind_num=(num)
      self.kind = possibly_kinds[num.to_i] || ''
    end
  end
end
