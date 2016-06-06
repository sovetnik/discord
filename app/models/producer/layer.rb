class Layer
  attr_reader :entity
  def initialize(entity)
    @entity = entity
  end

  def sentence
    "from #{entity.name} point of view"
  end
end
