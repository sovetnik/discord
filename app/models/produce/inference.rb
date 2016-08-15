# frozen_string_literal: true
module Produce
  class Inference < ConcreteProducer
    def to_ruby
      ["# => #{repo.name.underscore}"]
    end

    def to_spec
      Spec.new(repo).generate_spec
    end

    def to_stub
      Spec.new(repo).generate_stub
    end

    def to_ruby_path
      ''
    end

    def child_kinds
      []
      # %w(Layer Ability)
    end

    def sentence
      "return #{repo.name}"
    end

    def abstractable?
      false
    end

    def axioms
      repo.parent.examples.axioms
    end

    def origin_name
      repo.ancestors.abilities.first.name
    end
  end
end
