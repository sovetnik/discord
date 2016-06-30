# frozen_string_literal: true
module Entity
  class Abstract < ABSTRACT
    ## define layer
    def producer
      Producer.new self
    end
  end
end
