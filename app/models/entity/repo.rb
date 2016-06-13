module Entity
  class Repo < ActiveRecord::Base
    self.table_name = 'entities'
    acts_as_tree order: 'sort_order'

    scope :layers, -> { where(kind: 'Layer') }
    scope :stories, -> { where(kind: 'Story') }

    attr_accessor :addict

    ## way to abstract layer
    def abstract
      Abstract.new self
    end

    def layer
      self.class.layers.find(layer_id) if layer_id
    end

    ## kind num getter
    def kind_num
      Abstract::KINDS.rindex kind
    end

    ## kind setter by num
    def kind_num=(num)
      self.kind = Abstract::KINDS[num.to_i] || ''
    end

    def kinds_list
      Abstract::KINDS.map.with_index { |obj, index| [index, obj] }
    end

    ## Possible values to collection select & validation
    def parents_list
      self.class.all
    end

    def add_child(params)
      children.create(params)
    end

    def addictions
      root.descendants.where(kind: kind, id: deps.addictions)
    end

    def possibly_deps
      root.descendants.where(kind: kind) # matches layer
    end

    ## TODO: write method to store layers of addict too
    def possibly_deps_attributes= atts
      addict = []
      atts.keys.each do |key|
        addict << atts.dig(key, 'id') if atts.dig(key, 'supply').to_i > 0
      end
      layer.deps[:open] = addict
    end

    def layers_list
      list = []
      list << parent.siblings.layers unless root?
      list << siblings.layers unless root?
      list << children.layers
      list.flatten
    end
  end
end
