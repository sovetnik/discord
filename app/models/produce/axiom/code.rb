# frozen_string_literal: true
class Produce::Axiom::Code
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_code
    [axiom_line]
  end

  private

  def axiom_line
    repo.abstract.nil? ? inference_undefined : inference_abstract
  end

  def inference_undefined
    "# undefined => #{repo.name}"
  end

  def inference_abstract
    "# #{repo.abstract.parent.name}.#{repo.abstract.name} => #{repo.name}"
  end
end
