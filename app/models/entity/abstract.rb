module Entity
  class Abstract
    attr_reader :name, :kind, :layer_id, :repo
    def initialize(obj)
      @name = obj.name
      @kind = obj.kind
      @layer_id = obj.layer_id
      @repo = obj
    end

    # #const
    KINDS = %w(Aught Story Domain Layer Model Context Inference).freeze

    ## interface
    def sentence
      [producer.sentence, layer_sentence].join ' '
    end

    def layer_sentence
      "in #{repo.layer.name}" if repo.layer
    end

    ## define layer
    def producer
      Producer.new repo
    end
  end
end
