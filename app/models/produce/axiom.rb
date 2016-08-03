# frozen_string_literal: true
module Produce
  class Axiom < ConcreteProducer

    def to_ruby
      Code.new(repo).generate_code
    end

    def to_ruby_path
      ''
    end

    def to_spec
      Spec.new(repo).generate_spec
    end

    def child_kinds
      []
    end

    def sentence
      "Should supply #{repo.desc} and return #{repo.name}"
    end

    def abstractable?
      true
    end

    def abstract_kind
      'Ability'
    end

    def contexts
      if repo.abstract.nil?
        []
      else
        repo.abstract.descendants.inferences.collect(&:name)
      end
    end
  end
end
