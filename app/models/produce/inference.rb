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

    def to_spec
      ["it '#{repo.desc}'", 'end']
    end

    def to_ruby_path
      ''
    end

    def abstractable?
      true
    end

    def abstract_kind
      'Context'
    end
  end
end
