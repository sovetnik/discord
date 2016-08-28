# frozen_string_literal: true
class Produce::Context::Spec
  attr_reader :producer

  def initialize(producer)
    @producer = producer
  end

  def generate_spec
    [head_line, [stub_line], content, 'end']
  end

  def head_line
    "context 'when #{producer.abstract.example_name} is #{producer.inference_body}' do"
  end

  def stub_line
    producer.abstract.to_stub
  end

  def content
    producer.child_inferences.any? ? inference_spec : common_lines
  end

  def common_lines
    context_lines.any? ? context_lines : ['#=> expectation not defined yet']
  end

  def context_lines
    producer.child_contexts.flat_map(&:producer).flat_map(&:to_spec)
  end

  def inference_spec
    producer.child_inferences.flat_map(&:producer).flat_map(&:to_spec)
  end

  # OPTIMIZE: maybe layer_name?
  def ability_name
    producer.abstract.ability.name
  end

  # OPTIMIZE: maybe layer_name?
  def layer_name
    producer.abstract.layer.name
  end
end
