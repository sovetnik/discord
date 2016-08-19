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
    "context 'when #{repo.abstract.producer.example_name} is #{repo.producer.inference_body}' do"
  end

  def stub_line
    repo.abstract.producer.to_stub
  end

  def content
    repo.children.inferences.any? ? inference_spec : common_lines
  end

  def common_lines
    context_lines.any? ? context_lines : ['#=> expectation not defined yet']
  end

  def context_lines
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
