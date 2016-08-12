# frozen_string_literal: true
class Produce::Context::Spec
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_spec
    [head_line, content, 'end']
  end

  def head_line
    "context 'when #{repo.producer.ability_body} is #{repo.producer.inference_body}'"
  end

  def content
    repo.children.contexts.any? ? context_spec : inference_spec
  end

  def context_spec
    repo.children.contexts.flat_map(&:producer).flat_map(&:to_spec)
  end

  def inference_spec
    repo.children.inferences.flat_map(&:producer).flat_map(&:to_spec)
  end
end
