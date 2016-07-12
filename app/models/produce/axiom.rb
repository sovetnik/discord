# frozen_string_literal: true
module Produce
  class Axiom < ConcreteProducer
    # it is a source for ability

    # in code: method dependency, from same class (private),
    # from opened layers (common) or from abstract layers (contracts)
    # in spec: generates let
    # in filesystem: nothing

    def child_kinds
      %w(Aught)
    end

    def sentence
      "Should supply #{repo.desc} and return #{repo.name}"
    end

    def to_ruby
      Code.new(repo).generate_code
    end

    def generate_spec
      ["let #{repo.name}"]
    end

    def path_line
      repo.parent.producer.path_line
    end

    def abstractable?
      true
    end

    def abstract_kind
      'Ability'
    end
  end
end
