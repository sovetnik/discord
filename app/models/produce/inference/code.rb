# frozen_string_literal: true
class Produce::Inference::Code
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_code
    ["# #{when_line} => #{repo.name.underscore}"]
  end

  private

  def when_line
    "when #{contexts.reverse.join(' and ')} "
  end

  def context_sequence
    contexts.reverse.join(' and ')
  end

  def contexts
    repo.ancestors.contexts.flat_map(&:producer).flat_map(&:to_ruby)
  end
end
