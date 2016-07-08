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

    def generate_code
      [axiom_line]
    end

    def abstractable?
      true
    end

    def abstract_kind
      'Ability'
    end

    private

    def axiom_line
      repo.abstract.nil? ? inference_undefined : inference_abstract
    end

    def inference_undefined
      "# undefined => #{repo.name}"
    end

    def inference_abstract
      "# #{repo.abstract.parent.name}.#{repo.abstract.name} => #{repo.name}"
    end
  end
end
