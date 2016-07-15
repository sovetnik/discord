# frozen_string_literal: true
module Entity
  class Repo < Layers::Repo
    self.table_name = 'entities'
    acts_as_tree order: 'sort_order'

    belongs_to :abstract, class_name: 'Repo'

    scope :abilities, -> { where(kind: 'Ability') }
    scope :axioms, -> { where(kind: 'Axiom') }
    scope :contexts, -> { where(kind: 'Context') }
    scope :inferences, -> { where(kind: 'Inference') }
    scope :layers, -> { where(kind: 'Layer') }
    scope :models, -> { where(kind: 'Model') }
    scope :stocks, -> { where(kind: 'Stock') }
    scope :stories, -> { where(kind: 'Story') }

    def picker
      Picker.new self, producer
    end

    def presenter
      Presenter.new self, producer
    end

    def producer
      Producer.wrap(self)
    end

    def abstract_layer_name
      abstract&.parent&.name
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
      picker.possibly_kinds.rindex kind
    end

    ## kind setter by num
    def kind_num=(num)
      self.kind = picker.possibly_kinds[num.to_i] || ''
    end
  end
end
