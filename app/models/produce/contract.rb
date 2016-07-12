# frozen_string_literal: true
module Produce
  class Contract < ConcreteProducer
    # Layers encapsulate some kind of model abilities,
    # contract describes public interface for them.

    # Contract should implement all interfase methods,
    # and spec for him should describe types of abilities inferences.
    # for example: array of strings

    # in code: class
    # in spec: file with root describe
    # in filesystem: is file

    def child_kinds
      %w(Guaranty)
    end

    def sentence
      "in #{repo.name} contract"
    end

    def generate_spec
      ["describe #{repo.name}"]
    end

    def path_line
      ''
    end

    def abstractable?
      false
    end
  end
end
