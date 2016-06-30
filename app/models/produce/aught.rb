# frozen_string_literal: true
module Produce
  class Aught < ConcreteProducer
    # Something we can differ against others
    # it is a basic Entity

    # in view:
    ## in preamble: sentence
    # TODO: Preamble creates context. Describe our entity.
    ## in details: name & desc
    ## in layer_tabs: none

    # in tree persist: as entity
    # in code: nothing
    # in spec: nothing
    # in filesystem: nothing

    def child_kinds
      []
    end

    def sentence
      "where pick out #{repo.name}"
    end

    def generate_code
      []
    end

    def addictable?
      false
    end
  end
end
