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

    def to_spec
      []
    end

    def to_ruby
      Code.new(repo).generate_code
    end

    def to_ruby_path
      Code.new(repo).generate_path
    end

    def abstractable?
      false
    end
  end
end
