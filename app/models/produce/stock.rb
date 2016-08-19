# frozen_string_literal: true
module Produce
  class Stock < ConcreteProducer
    # Generation
    def to_ruby
      []
    end

    def to_spec
      ["describe #{repo.name}"]
    end

    def to_ruby_path
      ''
    end

    def to_spec_path
      # Spec.new(repo).generate_path
    end

    def child_kinds
      []
    end

    def sentence
      "with #{repo.name}"
    end

    def abstractable?
      true
    end

    def abstract_kind
      'Layer'
    end
  end
end
