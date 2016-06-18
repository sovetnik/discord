class Story
  # Use case or accident in described domain

  # in view:
  ## in preamble: sentence
  ## in show: name & desc
  ## in layer_tabs: all interface metods grouped by all domain layers

  # in code: nothing
  # in spec: feature spec
  # in filesystem: nothing

  attr_reader :entity
  def initialize(entity)
    @entity = entity
  end

  def sentence
    "and listen a story about #{entity.name}"
  end

  def generate_code
    []
  end

  def has_dependencies?
    false
  end
end
