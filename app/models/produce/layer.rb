# frozen_string_literal: true
module Produce
  class Layer < ConcreteProducer
    def to_spec
      Spec.new(repo).generate_spec
    end

    def to_ruby
      Code.new(repo).generate_code
    end

    def to_ruby_path
      Code.new(repo).generate_path
    end

    def child_kinds
      %w(Ability Stock)
    end

    def sentence
      "from #{repo.name} point of view"
    end

    def abstractable?
      true
    end

    def abstract_kind
      'Layer'
    end
  end
end
