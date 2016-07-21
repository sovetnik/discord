# frozen_string_literal: true
module Produce
  class Model < ConcreteProducer
    # Reflection on real world concept, which have identity

    # in code: module
    # in spec: folder (or file if model is very compact)
    # in filesystem: is folder (or file if model is very compact)

    def child_kinds
      %w(Layer Model Contract)
    end

    def sentence
      "where exist #{repo.name}"
    end

    def to_spec
      Spec.new(repo).generate_spec
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

    def module_name
      Code.new(repo).generate_code
    end
    #  => ["Chaos", "Message"]
  end
end
