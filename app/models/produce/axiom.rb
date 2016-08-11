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

    def inferences
      return [] if repo.abstract.nil?
      repo.abstract&.producer&.inferences
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

    def build_contexts_for(nodes)
      if inferences.count.positive?
        contexts = []
        nodes.each do |node|
          inferences.each { |inf| contexts << node.children.contexts.find_or_initialize_by(abstract: inf) }
        end
        contexts
      else
        nodes
      end
    end

    # TODO: maybe deprecate
    def contextable?
      inferences ? inferences.count > 1 : false
    end

    # TODO: maybe deprecate
    def contexts
      if repo.abstract.nil?
        []
      else
        repo.abstract.descendants.inferences.collect(&:name)
      end
    end
  end
end
