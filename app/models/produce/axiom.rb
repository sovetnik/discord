# frozen_string_literal: true
module Produce
  class Axiom < ConcreteProducer
    # Generation
    def to_ruby
      Code.new(repo).generate_code
    end

    def to_ruby_path
      ''
    end

    def to_spec
      []
    end

    def to_spec_path
      # Spec.new(repo).generate_path
    end

    def sentence
      "know #{repo.title}"
    end

    def child_kinds
      ['Example']
    end

    def abstractable?
      true
    end

    def abstract_kind
      'Ability'
    end

    def axi_name
      if repo.abstract.nil?
        repo.name
      else
        repo.abstract.parent.name
      end
    end

    # Relations
    def happens
      if repo.abstract.nil?
        repo.children.examples
      else
        repo.abstract.producer.inferences
      end
    end

    def refresh_context_tree_for(nodes)
      if happens.count > 1
        refresh_context_tree(nodes)
      else
        nodes
      end
    end

    def refresh_context_tree(nodes)
      contexts = []
      nodes.each do |node|
        happens.each { |i| contexts << node.children.contexts.find_or_create_by(abstract: i) }
        node.children.contexts.where.not(id: contexts.map(&:id)).each(&:destroy)
      end
      contexts
    end
  end
end
