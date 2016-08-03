# frozen_string_literal: true
module Produce
  class Ability < ConcreteProducer

    def to_ruby
      Code.new(repo).generate_code
    end

    def to_spec
      Spec.new(repo).generate_spec
    end

    def to_ruby_path
      Code.new(repo).generate_path
    end

    def possibly_contexts
      repo.descendants.axioms.collect(&:producer).collect(&:contexts)
    end

    def to_axiom
      [repo.name, repo.parent.name].join('.')
    end

    def child_kinds
      %w(Axiom Context Inference)
    end

    def sentence
      "can understand #{repo.name}"
    end

    def abstractable?
      true
    end

    def abstract_kind
      'Ability'
    end
  end
end
