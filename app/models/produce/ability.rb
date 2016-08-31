# frozen_string_literal: true
module Produce
  class Ability < ConcreteProducer
    # Generation
    def to_ruby
      Code.new(self).generate_code
    end

    def to_spec
      Spec.new(self).generate_spec
    end

    def signature
      Code.new(self).signature
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

    # Relations

    def layer
      repo.parent.producer
    end

    def axioms
      repo.children.axioms
    end

    def child_contexts
      repo.children.contexts
    end

    def stocks
      repo.siblings.stocks
    end

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
      repo.children.axioms.collect(&:producer).flat_map(&:happens).collect(&:id)
    end
  end
end
