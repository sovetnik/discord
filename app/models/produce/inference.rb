# frozen_string_literal: true
module Produce
  class Inference < ConcreteProducer
    # Relations
    def axioms
      repo.parent.examples.axioms
    end

    def ability
      repo.ancestors.abilities.first
    end

    def layer
      repo.ancestors.layers.first
    end

    # Generation
    def to_ruby
      Code.new(repo).generate_code
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

    def example_name
      repo.ancestors.abilities.first.name
    end
  end
end
