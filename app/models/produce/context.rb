# frozen_string_literal: true
module Produce
  class Context < ConcreteProducer
    # Relations

    def abstract
      repo.abstract.producer
    end

    def inferences
      repo.descendants.inferences
    end

    def child_contexts
      repo.children.contexts
    end

    def child_inferences
      repo.children.inferences
    end

    # Generation
    def to_ruby
      [[ability_body, inference_body].join(' is ')]
    end

    def to_ruby_path
      ''
    end

    def to_spec
      Spec.new(self).generate_spec
    end

    def to_spec_path
      # Spec.new(repo).generate_path
    end

    def child_kinds
      ['Inference']
    end

    def sentence
      "when #{repo.title}"
    end

    def abstractable?
      true
    end

    def abstract_kind
      'Inference'
    end

    def wiredrawn?
      repo.abstract.nil?
    end

    def ability_body
      wiredrawn? ? 'undefined' : repo.abstract.ancestors.abilities.first.producer.signature
    end

    def inference_body
      wiredrawn? ? 'nothing' : repo.abstract.name
    end
  end
end
