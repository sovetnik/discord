# frozen_string_literal: true
module Produce
  class Ability < ConcreteProducer
    # Generation
    def to_ruby
      Code.new(repo).generate_code
    end

    def to_spec
      Spec.new(repo).generate_spec
    end

    def to_ruby_path
      ''
    end

    def to_spec_path
      ''
    end

    def sentence
      "tell #{repo.name}"
    end

    def child_kinds
      %w(Axiom Context Inference)
    end

    def abstractable?
      true
    end

    def abstract_kind
      'Ability'
    end

    def signature
      Code.new(repo).signature
    end

    # Relations
    def inferences
      repo.descendants.inferences
    end

    def update_context_tree!
      clean_dead_contexts
      nodes = [repo]
      repo.children.axioms.each do |axiom|
        nodes = axiom.producer.refresh_context_tree_for(nodes)
      end
      nodes
    end

    def clean_dead_contexts
      repo.children.contexts.where.not(id: all_abstracts_ids).each(&:destroy)
    end

    def all_abstracts_ids
      repo.children.axioms.collect(&:producer).flat_map(&:abstracts).collect(&:id)
    end

    # TODO: maybe deprecate
    def to_axiom
      [repo.name, repo.parent.name].join('.')
    end
  end
end
