# frozen_string_literal: true
class Produce::Axiom::Code
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_code
    repo.abstract.nil? ? inference_undefined : inference_abstract
  end

  private

  def inference_undefined
    ["# undefined => #{repo.name}"]
  end

  def inference_abstract
    [inference_name, contexts]
  end

  def inference_name
    "# #{[repo.abstract.parent.name.underscore, repo.abstract.name].join('.')}:"
  end

  def contexts
    repo.abstract.descendants.inferences.collect(&:name).map { |c| "# => #{c}" }
  end
end
