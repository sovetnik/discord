# frozen_string_literal: true
module Produce
  class Axiom < ConcreteProducer
    # it is a source for ability

    # in code: method dependency, from same class (private),
    # from opened layers (common) or from abstract layers (contracts)
    # in spec: generates let
    # in filesystem: nothing

    def contexts
      if repo.abstract.nil?
        []
      else
        repo.abstract.descendants.inferences.collect(&:name)
      end
    end

    def child_kinds
      []
    end

    def sentence
      "Should supply #{repo.desc} and return #{repo.name}"
    end

    def to_ruby
      Code.new(repo).generate_code
    end

    def to_ruby_path
      ''
    end

    def to_spec
      Spec.new(repo).generate_spec
    end

    def abstractable?
      true
    end

    def abstract_kind
      'Ability'
    end
  end
end
