# frozen_string_literal: true
module Produce
  class Story < ConcreteProducer
    # Generation
    def to_ruby
      []
    end

    def to_spec
      []
    end

    def to_ruby_path
      ''
    end

    def to_spec_path
      # Spec.new(repo).generate_path
    end

    def child_kinds
      %w(Story)
    end

    def sentence
      "story of #{repo.name}"
    end

    def const_name
      [repo.parent.producer.const_name, repo.name].compact.join '::'
    end

    def abstractable?
      false
    end
  end
end
