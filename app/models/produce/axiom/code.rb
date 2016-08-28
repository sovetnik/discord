# frozen_string_literal: true
class Produce::Axiom::Code
  attr_reader :repo, :producer

  def initialize(repo)
    @repo = repo
    @producer = repo.producer
  end

  def generate_code
    [[origin, contexts].join(' contexts: ')]
  end

  private

  def origin
    if repo.abstract
      repo.abstract.producer.signature
    else
      repo.name
    end
  end

  def contexts
    producer.happens.collect(&:name).join ', '
  end
end
