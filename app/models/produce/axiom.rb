# frozen_string_literal: true
module Produce
  class Axiom < ConcreteProducer
    def to_ruby
      Code.new(repo).generate_code
    end

    def to_ruby_path
      ''
    end

    def to_spec
      Spec.new(repo).generate_spec
    end

    def child_kinds
      []
    end

    def sentence
      "Should supply #{repo.desc} and return #{repo.name}"
    end

    def abstractable?
      true
    end

    def abstract_kind
      'Ability'
    end

    def inferences
      return [] if repo.abstract.nil?
      repo.abstract&.producer&.inferences
    end

    def refresh_context_tree_for(nodes)
      if inferences.count.positive?
        refresh_context_tree(nodes)
      else
        nodes
      end
    end

    def refresh_context_tree(nodes)
      contexts = []
      nodes.each do |node|
        inferences.each { |i| contexts << node.children.contexts.find_or_create_by(abstract: i) }
        node.children.contexts.where.not(id: contexts.map(&:id)).each(&:destroy)
      end
      contexts
    end
  end
end
