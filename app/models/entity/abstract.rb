# frozen_string_literal: true
module Entity
  class Abstract < Struct.new 'Abstract', :id, :name, :kind, :layer_id
    ## define layer
    def producer
      Producer.new self
    end
  end
end
