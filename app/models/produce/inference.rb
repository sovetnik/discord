# frozen_string_literal: true
module Produce
  class Inference < ConcreteProducer
    # Generation
    def to_ruby
      ["# => #{repo.name.underscore}"]
    end

    def to_ruby_path
      ''
    end

    def to_spec
      Spec.new(repo).generate_spec
    end

    def to_stub
      Spec.new(repo).generate_stub
    end

    def to_spec_path
      # Spec.new(repo).generate_path
    end

    def child_kinds
      []
    end

    def sentence
      "return #{repo.name}"
    end

    def abstractable?
      false
    end

    # Relations
    def axioms
      repo.parent.examples.axioms
    end

    def example_name
      repo.ancestors.abilities.first.name
    end
  end
end
