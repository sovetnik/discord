# frozen_string_literal: true
module Produce
  class Context < ConcreteProducer

    def to_ruby
      ["context '#{repo.name}' do"]
    end

    def to_ruby_path
      ''
    end

    def to_spec
      ["context #{repo.name}"]
    end

    def child_kinds
      []
    end

    def sentence
      "when #{repo.name}"
    end

    def abstractable?
      true
    end

    def abstract_kind
      'Inference'
    end
  end
end
