# frozen_string_literal: true
module Produce
  class Stock < ConcreteProducer
    # Avaliable layer from this layer

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

    def to_spec
      ["describe #{repo.name}"]
    end

    def to_ruby_path
      ''
    end

    def abstractable?
      true
    end

    def abstract_kind
      'Layer'
    end
  end
end
