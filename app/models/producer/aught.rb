# frozen_string_literal: true
class Aught
  # Something we can differ against others
  # it is a basic Entity

  # in view:
  ## in preamble: sentence
  # TODO: Preamble creates context. Describe our entity.
  ## in details: name & desc
  ## in layer_tabs: none

  # in tree persist: as entity
  # in code: nothing
  # in spec: nothing
  # in filesystem: nothing

  attr_reader :repo
  def initialize(repo)
    @repo = repo
  end

  def child_kinds
    %w(Aught)
  end

  def sentence
    "where pick out #{repo.name}"
  end

  def generate_code
    []
  end

  def addictable?
    false
  end
end
