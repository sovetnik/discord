# frozen_string_literal: true
class Produce::Ability::Code
  attr_reader :producer

  def initialize(producer)
    @producer = producer
  end

  def generate_code
    [signature_line, axiom_code, inference_code, "end\n"]
  end

  def signature_line
    "def #{signature}"
  end

  def signature
    "#{producer.repo.name}#{args_line}"
  end

  private

  def args_line
    "(#{args_list.compact.uniq.map(&:underscore).join(', ')})" unless args_list.empty?
  end

  def args_list
    axiom_layers_names - stock_names
  end

  def axiom_layers_names
    producer.axioms.flat_map(&:producer).collect(&:axi_name)
  end

  def stock_names
    producer.stocks.collect(&:title) << producer.layer.layer_name
  end

  def axiom_code
    producer.axioms.flat_map { |a| a.producer.to_ruby }
  end

  def inference_code
    producer.inferences.collect(&:producer).flat_map(&:to_ruby)
  end
end
