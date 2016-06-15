class Story
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
