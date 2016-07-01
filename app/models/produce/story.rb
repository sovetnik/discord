# frozen_string_literal: true
module Produce
  class Story < ConcreteProducer
    # Use case or accident in described domain

    # in code: nothing
    # in spec: feature spec
    # in filesystem: nothing

    def child_kinds
      %w(Aught)
    end

    def sentence
      "and listen a story about #{repo.name}"
    end

    def generate_code
      []
    end

    def const_name
      [repo.parent.producer.const_name, repo.name].compact.join '::'
    end

    def addictable?
      false
    end
  end
end
