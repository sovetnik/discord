# frozen_string_literal: true
module Produce
  class Ability < ConcreteProducer
    # it is a function or method Entity

    ## block of def ... ... end with argument, deps & result
    ## in layer_tabs#  none

    # in code: method with same name, including
    # argument(zero or several), axiom(several) and inference(one or more)
    # in spec: generates describe
    # in filesystem: nothing

    def child_kinds
      %w(Aught Axiom Inference)
    end

    def sentence
      "can understand #{repo.name}"
    end

    def generate_code
      ["def #{repo.name}#{args_list}", axiom_code, inference_code]
    end

    def abstractable?
      true
    end

    def abstract_kind
      'Guaranty'
    end

    def args_list
      '(args)'
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
