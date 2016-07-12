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

    def generate_spec
      ["describe #{repo.name}"]
    end

    def to_ruby
      Code.new(repo).generate_code
    end

    def path_line
      repo.parent.producer.path_line
    end

    def abstractable?
      true
    end

    def abstract_kind
      'Guaranty'
    end
  end
end
