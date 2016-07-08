# frozen_string_literal: true
module Produce
  class Guaranty < ConcreteProducer
    # it is a function or method which must be implemented in
    # ability from layer which abstract is guaranty contract

    ## block of def ... ... end with argument, deps & result
    ## in layer_tabs#  none

    # in code: method with same name, including
    # argument(zero or several), axiom(several) and inference(one or more)
    # in spec: generates describe
    # in filesystem: nothing

    def child_kinds
      %w(Axiom Inference)
    end

    def sentence
      "Should obey #{repo.name}"
    end

    def generate_code
      ["def #{repo.name}#{args_list}", imp_code, axiom_code, inference_code]
    end

    def addictable?
      true
    end

    def abstractable?
      false
    end

    private

    def args_list
      '(args)'
    end

    def imp_code
      "raise 'Must be implemented in concrete layer'"
    end

    def axiom_code
      code = repo.children.axioms.collect { |i| i.producer.generate_code }
      code.flatten 1
    end

    def inference_code
      code = repo.children.inferences.collect { |i| i.producer.generate_code }
      "end #{code.flatten.first} \n"
    end
  end
end
