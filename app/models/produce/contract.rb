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

    def to_ruby
      Code.new(repo).generate_code
    end

    def to_ruby_path
      Code.new(repo).generate_path
    end

    def generate_spec
      ["describe #{repo.name}"]
    end

    def abstractable?
      false
    end
  end
end
