# frozen_string_literal: true
module Produce
  class Stock < ConcreteProducer
    def to_ruby
      []
    end

    def to_spec
      ["describe #{repo.name}"]
    end

    def to_ruby_path
      ''
    end

    def child_kinds
      []
    end

    def sentence
      "with #{repo.name}"
    end

    def abstractable?
      true
    end

    def abstract_kind
      'Layer'
    end
  end
end
