# frozen_string_literal: true
module Produce
  class Ability < ConcreteProducer
    # TODO: Write details about responsibility
    # Responsibility
    # it is a root Entity

    # in view:
    ## in preamble: sentence
    ## in details: name & desc
    ## block of def ... ... end with argument, deps & result
    ## in layer_tabs#  none

    # in tree: persist as repo
    # in code: method with same name, including
    # argument(zero or several), dependencies(several) and result(one or more)
    # in spec: generates describe
    # in filesystem: nothing

    def child_kinds
      %w(Aught Axiom Inference)
    end

    def sentence
      "Should obey #{repo.name}"
    end

    def generate_code
      ["def #{repo.name}#{args_list}", axiom_code, inference_code]
    end

    def addictable?
      true
    end

    def dep_code
      "# #{repo.parent.name.underscore}.#{repo.name.underscore}"
    end

    def args_list
    #   list = []
    #   repo.addicts_exist.each do |addict|
    #     unless repo.parent.producer.addicts_list['layer'].include? addict.parent.id
    #       list << addict.parent.name
    #     end
    #   end
    #   line = list.map(&:underscore).uniq.join ', '
    #   line.empty? ? '' : "(#{line})"
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
