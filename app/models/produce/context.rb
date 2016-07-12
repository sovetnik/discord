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
      # %w(Context)
    end

    def sentence
      "when #{repo.name}"
    end

    def to_ruby
      ["context '#{repo.name}' do"]
    end

    def generate_spec
      ["context #{repo.name}"]
    end

    def path_line
      ''
    end

    def abstractable?
      false
    end
  end
end
