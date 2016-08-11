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

    def child_kinds
      %w(Axiom Context Inference)
    end

    def inferences
      repo.descendants.inferences
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

    def create_context_tree!
      nodes = [repo]
      repo.children.axioms.each do |axiom|
        nodes = axiom.producer.create_contexts_for(nodes)
      end
      nodes
    end

    # TODO: maybe deprecate
    def to_axiom
      [repo.name, repo.parent.name].join('.')
    end
  end
end
