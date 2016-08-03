# frozen_string_literal: true
module Produce
  class Inference < ConcreteProducer

    def to_ruby
      ["# => #{repo.name.underscore}"]
    end

    def to_spec
      ["it '#{repo.desc}'", 'end']
    end

    def to_ruby_path
      ''
    end

    def child_kinds
      []
      # %w(Layer Ability)
    end

    def sentence
      "Should return #{repo.name}, #{repo.name}"
    end

    def abstractable?
      false
    end
  end
end
