class Story
  # Use case or accident in described domain

  # in code nothing
  # in spec feature spec
  # in filesystem nothing

  attr_reader :entity
  def initialize(entity)
    @entity = entity
  end

  def sentence
    "and listen a story about #{entity.name}"
  end

  def has_dependencies?
    false
  end
end
