# frozen_string_literal: true
module Produce
  class Aught < ConcreteProducer
    # Something we can differ against others
    # it is a basic Entity, without any effects

    # in code: nothing
    # in spec: nothing
    # in filesystem: nothing

    def child_kinds
      ['Aught']
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
