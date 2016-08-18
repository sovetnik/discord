# frozen_string_literal: true
class Produce::Example::Spec
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_spec
    []
  end

  def generate_stub
    "let(:#{axiom_name}) { #{repo.name} }"
  end

  def axiom_name
    repo.parent.name
  end
end


