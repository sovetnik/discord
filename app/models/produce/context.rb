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
      Spec.new(repo).generate_spec
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

    def wiredrawn?
      repo.abstract.nil?
    end

    def ability_body
      wiredrawn? ? 'undefined' : repo.abstract.parent.name
    end

    def inference_body
      wiredrawn? ? 'nothing' : repo.abstract.name
    end
  end
end
