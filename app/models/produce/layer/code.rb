# frozen_string_literal: true
class Produce::Layer::Code
  attr_reader :producer

  def initialize(producer)
    @producer = producer
  end

  def generate_code
    [module_line, [head_line, [init_lines, abilities_code], 'end'], 'end']
  end

  private

  def module_line
    "module #{producer.module_name}"
  end

  def head_line
    "class #{producer.layer_name}"
  end

  def init_lines
    if stocked_names.any?
      [attr_line,
       "def initialize(#{stocked_names.join(', ')})",
       variables_lines,
       "end\n"]
    else
      []
    end
  end

  def attr_line
    "attr_reader #{stocked_symbols.join(', ')}\n"
  end

  def variables_lines
    stocked_names.map { |name| "@#{name} = #{name}" }
  end

  def stocked_symbols
    stocked_names.map { |s| ':' + s }
  end

  def stocked_names
    producer.stocks.collect(&:title).map(&:underscore)
  end

  def abilities_code
    code = producer.abilities.flat_map { |i| i.producer.to_ruby }
  end
end
