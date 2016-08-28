# frozen_string_literal: true
module Produce
  class Inference < ConcreteProducer
    # Relations

    def name
      repo.name
    end

    def axioms
      repo.parent.exemplars.axioms
    end

    def contexts
      repo.ancestors.contexts
    end

    def ability
      repo.ancestors.abilities.first
    end

    def layer
      repo.ancestors.layers.first
    end

    # Generation
    def to_ruby
      Code.new(self).generate_code
    end

    def to_ruby_path
      ''
    end

    def to_spec
      Spec.new(self).generate_spec
    end

    def to_stub
      Spec.new(self).generate_stub
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
