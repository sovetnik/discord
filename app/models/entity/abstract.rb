# frozen_string_literal: true
module Entity
  class Abstract
    attr_reader :id, :name, :kind, :layer_id
    def initialize(atts)
      @id = atts['id']
      @name = atts['name']
      @kind = atts['kind']
      @layer_id = atts['layer_id']
    end

    ## define layer
    def producer
      Producer.new repo
    end
  end
end
