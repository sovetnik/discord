# frozen_string_literal: true
module Entity
  class Abstract
    attr_reader :name, :kind, :layer_id, :repo
    def initialize(obj)
      @name = obj.name
      @kind = obj.kind
      @layer_id = obj.layer_id
      @repo = obj
    end

    ## define layer
    def producer
      Producer.new repo
    end
  end
end
