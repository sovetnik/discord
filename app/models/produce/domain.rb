# frozen_string_literal: true
module Produce
  class Domain < ConcreteProducer
    # Generation
    def to_ruby
      []
    end

    def to_ruby_path
      ''
    end

    def to_spec
      ["describe #{repo.name}"]
    end

    def to_spec_path
      # Spec.new(repo).generate_path
    end

    def child_kinds
      %w(Story Model Domain)
    end

    def sentence
      "look at #{repo.name}"
    end

    def abstractable?
      false
    end

    def const_name
      nil
    end
  end
end
