class Story
  attr_reader :entity
  def initialize(entity)
    @entity = entity
  end

  def sentence
    "and listen a story about #{entity.name}"
  end
end
