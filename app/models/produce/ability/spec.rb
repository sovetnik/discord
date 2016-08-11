# frozen_string_literal: true
class Produce::Ability::Spec
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_spec
    ["describe '##{repo.name}'", axiom_spec, context_spec, inf_spec, 'end']
  end

  def axiom_spec
    repo.descendants.axioms.collect(&:producer).collect(&:to_spec).flatten
  end

  def context_spec
    repo.children.contexts.collect(&:producer).collect(&:to_spec)
  end

  def inf_spec
    repo.descendants.inferences.collect(&:producer).collect(&:to_spec).flatten
  end
end
