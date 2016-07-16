# frozen_string_literal: true
module Produce
  class Aught < ConcreteProducer
    # Something we can differ against others
    # it is a basic Entity, without any effects

    # in code: nothing
    # in spec: nothing
    # in filesystem: nothing

    def child_kinds
      []
    end

    def sentence
      "where pick out #{repo.name}"
    end

    def to_ruby
      []
    end

    def generate_spec
      []
    end

    def to_ruby_path
      ''
    end

    def abstractable?
      false
    end
  end
end
