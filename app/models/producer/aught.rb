class Aught
  attr_reader :entity
  def initialize(entity)
    @entity = entity
  end

  def sentence
    "we pick out #{entity.name}"
  end
end
