# frozen_string_literal: true
class Produce::Layer::Spec
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_spec
    ["describe #{repo.name}", ability_spec, 'end']
  end

  def ability_spec
    repo.descendants.abilities.flat_map(&:producer).flat_map(&:to_spec)
  end
end
