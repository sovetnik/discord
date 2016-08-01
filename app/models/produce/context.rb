# frozen_string_literal: true
module Produce
  class Context < ConcreteProducer
    # Something that determine variant after bifurcation
    # it is a condition Entity

    # in tree: persist as entity
    # in code: nothing
    # in spec: generates context with same name
    # in filesystem: nothing

    def child_kinds
      []
    end

    def sentence
      "when #{repo.name}"
    end

    def to_ruby
      ["context '#{repo.name}' do"]
    end

    def to_ruby_path
      ''
    end

    def to_spec
      ["context #{repo.name}"]
    end

    def abstractable?
      true
    end

    def abstract_kind
      'Inference'
    end
  end
end
