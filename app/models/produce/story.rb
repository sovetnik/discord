# frozen_string_literal: true
module Produce
  class Story < ConcreteProducer
    # Use case or accident in described domain

    # in code: nothing
    # in spec: feature spec
    # in filesystem: nothing

    def child_kinds
      %w(Story)
    end

    def sentence
      "and listen a story about #{repo.name}"
    end

    def to_ruby
      []
    end

    def to_spec
      []
    end

    def to_ruby_path
      ''
    end

    def const_name
      [repo.parent.producer.const_name, repo.name].compact.join '::'
    end

    def abstractable?
      false
    end
  end
end
