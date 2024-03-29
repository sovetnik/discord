# frozen_string_literal: true
module Produce
  class Example < ConcreteProducer
    # Generation
    def to_ruby
      ["# => #{repo.name.underscore}"]
    end

    def to_spec
      Spec.new(repo).generate_spec
    end

    def to_ruby_path
      ''
    end

    def to_spec_path
      # Spec.new(repo).generate_path
    end

    def to_stub
      Spec.new(repo).generate_stub
    end

    def child_kinds
      []
    end

    def sentence
      "happens #{repo.name}"
    end

    def abstractable?
      false
    end

    # Relations
    def axioms
      if repo.parent.kind == 'Axiom'
        [repo.parent]
      else
        repo.parent.examples.axioms
      end
    end

    def example_name
      if repo.parent.kind == 'Axiom'
        repo.parent.name
      else
        repo.ancestors.abilities.first.name
      end
    end
  end
end
