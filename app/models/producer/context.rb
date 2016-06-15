class Context
  attr_reader :entity
  def initialize(entity)
    @entity = entity
  end

  def sentence
    "when #{entity.name}"
  end

  def has_dependencies?
    false
  end
end
