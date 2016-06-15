class Aught
  attr_reader :entity
  def initialize(entity)
    @entity = entity
  end

  def sentence
    "where pick out #{entity.name}"
  end

  def has_dependencies?
    false
  end
end
