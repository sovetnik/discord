# frozen_string_literal: true
class Produce::Inference::Spec
  attr_reader :producer

  def initialize(producer)
    @producer = producer
  end

  def generate_spec
    [head_line, content_lines, 'end']
  end

  def generate_stub
    "allow(#{layer_name}).to receive(:#{ability_name}).and_return(#{producer.name})"
  end

  def head_line
    "it \"returnes #{producer.name}\" do"
  end

  def content_lines
    ["expect(subject.#{ability_name}).to equal(#{producer.name})"]
  end

  def ability_name
    producer.ability.name
  end

  def layer_name
    producer.layer.name.underscore
  end
end
