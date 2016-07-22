# frozen_string_literal: true
class Produce::Model::Spec
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_spec
    ["describe #{repo.name}"]
  end
end
