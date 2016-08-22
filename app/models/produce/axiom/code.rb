# frozen_string_literal: true
class Produce::Axiom::Code
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_code
    [[origin, contexts].join(' contexts: ')]
  end

  private

  def origin
    if repo.abstract
      repo.abstract.producer.signature
    else
      repo.name.underscore
    end
  end

  def contexts
    if repo.abstract
      repo.abstract.descendants.inferences
    else
      repo.descendants.examples
    end.collect(&:name).join ', '
  end
end
