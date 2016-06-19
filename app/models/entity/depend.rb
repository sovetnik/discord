module Entity
  class Depend

    # Inference or layer dependency
    # it is a leaf entity

    # in tree: persist as deps in hash like
    # { inference: { depends: [23, 42] }} where first key inference
    # in code: dependency line
    # in spec: maybe let ?
    # in filesystem: nothing

    attr_reader :id, :layer_id, :name, :addict
    def initialize entity, addict=1
      @id = entity.id
      @layer_id = entity.layer_id
      @name = "id: #{id} #{entity.kind}::#{entity.layer&.name}.#{entity.name}"
      @addict = addict
    end

    # used from dependency_form
    def persisted?
      true
    end
  end
end