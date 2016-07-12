# frozen_string_literal: true
class Produce::Layer::Code
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_code
    [head_line, stocks_line, abilities_code, footer_code]
  end

  private

  def head_line
    "class #{module_name}::#{repo.name}"
  end

  def module_name
    repo.ancestors.models.reverse.collect(&:name).join '::'
  end #  => ["Chaos", "Message"]

  def stocked_layers
    stocks = []
    repo.children.stocks.collect(&:name).each do |stock|
      stocks << (':' + stock.underscore)
    end
    stocks
  end

  def stocks_line
    ["open_layers #{stocked_layers.join(', ')}\n"] if stocked_layers.any?
  end

  def abilities_code
    code = repo.children.abilities.collect { |i| i.producer.to_ruby }
    code.flatten 1
  end

  def footer_code
    "end\n"
  end
end
