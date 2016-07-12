# frozen_string_literal: true
class Produce::Guaranty::Code
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_code
    ["def #{repo.name}#{args_list}", imp_code, axiom_code, inference_code]
  end

  private

  def args_list
    '(args)'
  end

  def imp_code
    "raise 'Must be implemented in concrete layer'"
  end

  def axiom_code
    code = repo.children.axioms.collect { |i| i.producer.generate_code }
    code.flatten 1
  end

  def inference_code
    code = repo.children.inferences.collect { |i| i.producer.generate_code }
    "end #{code.flatten.first} \n"
  end
end
