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

    private

    def axiom_line
      repo.abstract.nil? ? [repo.name, 'udefined'] : inference_line
    end

    def inference_line
      "# #{repo.abstract.parent.parent.name}.#{repo.abstract.parent.name} => #{repo.abstract.name}"
    end
  end
end
