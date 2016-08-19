# frozen_string_literal: true
module Produce
  class Model < ConcreteProducer
    # Generation
    def to_ruby
      Code.new(repo).generate_code
    end

    def to_ruby_path
      Code.new(repo).generate_path
    end

    def to_spec
      Spec.new(repo).generate_spec
    end

    def to_spec_path
      # Spec.new(repo).generate_path
    end

    def child_kinds
      %w(Model Layer)
    end

    def sentence
      "where #{repo.name}"
    end

    def abstractable?
      false
    end
  end
end
