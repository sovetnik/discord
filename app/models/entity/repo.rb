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

    def depends
      self.class.where(id: depends_ids)
    end

    def possibly_deps
      depends = []
      root.descendants.where(kind: kind).each do |entity|
        depends << Depend.new(entity, addict?(entity))
      end
      depends
    end

    # set deps hash from attributes
    # income atts = {"0":{"id":"23","addict":"0"},"1":{"id":"7","addict":"1"}}
    # result deps = {"model"=>"[\"7\"]"} no modifying other keys
    def possibly_deps_attributes= atts
      addict = []
      atts.keys.each do |key|
        addict << atts.dig(key, 'id') if atts.dig(key, 'addict') != '0'
      end
      self.deps[kind.underscore] = addict.uniq
    end

    ## kind num getter
    def kind_num
      Abstract::KINDS.rindex kind
    end

    ## kind setter by num
    def kind_num=(num)
      self.kind = Abstract::KINDS[num.to_i] || ''
    end

    def layers_list
      list = []
      list << parent.siblings.layers unless root?
      list << siblings.layers unless root?
      # list << children.layers
      list.flatten.uniq
    end

    private

    def addict? entity
      deps_ids.include?(entity.id.to_s) ? 1 : 0
    end

    def deps_ids # where each id is string
      self.deps&.fetch(kind.underscore, []) || []
    end

    def depends_ids # where each id is integer
      deps_ids.scan(/\d+/).map &:to_i
    end
  end

  # TODO: separate class!
  class Depend
    attr_reader :id, :layer_id, :name, :addict
    def initialize entity, addict=1
      @id = entity.id
      @layer_id = entity.layer_id
      @name = "id: #{id} #{entity.kind}::#{entity.layer&.name}.#{entity.name}"
      @addict = addict
    end
    def persisted?
      true
    end
  end
end
