# frozen_string_literal: true
class Produce::Ability::Code
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_code
    [signature_line, axiom_code, 'end', inference_code, context_code]
  end

  def signature_line
    "def #{signature}"
  end

  def signature
    "#{repo.name}#{args_line}"
  end

  private

  def args_line
    "(#{args_list.compact.uniq.map(&:underscore).join(', ')})" unless args_list.empty?
  end

  def args_list
    axiom_layers_list - stock_list
  end

  def axiom_layers_list
    repo.children.axioms.collect &:abstract_layer_name
  end

  def stock_list
    repo.parent.children.stocks.collect &:abstract_layer_name
  end

  def axiom_code
    code = repo.children.axioms.collect { |i| i.producer.to_ruby }
    code.flatten 1
  end

  def inference_code
    repo.children.inferences.collect(&:name).map { |line| '# => ' + line }
  end

  def context_code
    repo.children.axioms.collect(&:name).map { |e| "# context #{e}" }
  end
end
