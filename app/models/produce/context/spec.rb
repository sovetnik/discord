# frozen_string_literal: true
class Produce::Context::Spec
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_spec
    [head_line, [stub_line], content, 'end']
  end

  def head_line
    "context 'when #{repo.producer.ability_body} is #{repo.producer.inference_body}'"
  end

  def stub_line
    if repo.abstract
      "allow(#{layer_name}).to receive(:#{ability_name}).and_return(#{abstract_name})"
    end
  end

  def content
    repo.children.inferences.any? ? inference_spec : context_spec
  end

  def context_spec
    repo.children.contexts.flat_map(&:producer).flat_map(&:to_spec)
  end

  def inference_spec
    repo.children.inferences.flat_map(&:producer).flat_map(&:to_spec)
  end

  def ability_name
    repo.abstract.ancestors.abilities.first.name
  end

  def layer_name
    repo.abstract.ancestors.layers.first.name.underscore
  end

  def abstract_name
    repo.abstract.name
  end
end
