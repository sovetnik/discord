# frozen_string_literal: true
module Produce
  class Inference < ConcreteProducer
    # Result and meaning for ability

    # in code: method
    # in spec: expectation( it )
    # in filesystem: nothing

    def child_kinds
      []
      # %w(Layer Ability)
    end

    def sentence
      "Should return #{repo.name}, #{repo.name}"
    end

    def to_ruby
      ["# => #{repo.name.underscore}"]
    end

    def generate_spec
      ["describe #{repo.name}"]
    end

    def path_line
      ''
    end

    def abstractable?
      false
    end
  end
end
