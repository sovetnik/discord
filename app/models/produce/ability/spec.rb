# frozen_string_literal: true
class Produce::Ability::Spec
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_spec
    ["describe '##{repo.name}' do", context_spec, 'end']
  end

  def axiom_spec
    repo.descendants.axioms.flat_map(&:producer).flat_map(&:to_spec)
  end

  def context_spec
    repo.children.contexts.flat_map(&:producer).flat_map(&:to_spec)
  end
end
