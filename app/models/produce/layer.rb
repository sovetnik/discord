# frozen_string_literal: true
module Produce
  class Layer < ConcreteProducer
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
      Spec.new(repo).generate_path
    end

    def child_kinds
      %w(Ability Axiom Stock)
    end

    def sentence
      "as #{repo.name}"
    end

    def abstractable?
      true
    end

    def abstract_kind
      'Layer'
    end

    # Relations
    def init_args
      repo.children.init_args
    end

    def reverse_ancestry
      repo.self_and_ancestors.collect(&:name).reverse
    end
  end
end
