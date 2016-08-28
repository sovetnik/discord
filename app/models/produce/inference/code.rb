# frozen_string_literal: true
class Produce::Inference::Code
  attr_reader :producer

  def initialize(producer)
    @producer = producer
  end

  def generate_code
    ["# #{when_line} => #{producer.name}"]
  end

  private

  def when_line
    "when #{contexts.reverse.join(' and ')} "
  end

  def contexts
    producer.contexts.flat_map(&:producer).flat_map(&:to_ruby)
  end
end
