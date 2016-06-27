# frozen_string_literal: true
class Story < Struct.new 'Story', :repo
  # Use case or accident in described domain

  # in view:
  ## in preamble: sentence
  ## in show: name & desc
  ## in layer_tabs: all interface metods grouped by all domain layers

  # in code: nothing
  # in spec: feature spec
  # in filesystem: nothing

  def child_kinds
    %w(Aught)
  end

  def sentence
    "and listen a story about #{repo.name}"
  end

  def generate_code
    []
  end

  def const_name
    [repo.parent.producer.const_name, repo.name].compact.join '::'
  end

  def addictable?
    false
  end
end
