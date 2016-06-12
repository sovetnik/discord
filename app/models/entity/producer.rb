module Entity
  class Producer
    # at this time producer depends only on
    # kind attribute method of passed object
    # but concrete_producer depends on method #name on passed object
    # so, we have two interface dependencies in object to work with him

    # depends_on :kind, :name

    attr_reader :object
    def initialize(object)
      @object = object
    end

    def sentence
      concrete_producer.sentence
    end

    def concrete_producer
      object.kind.constantize.new object
    end
  end
end
