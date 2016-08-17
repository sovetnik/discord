# frozen_string_literal: true
class Produce::Axiom::Spec
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_spec
    []
  end
end
