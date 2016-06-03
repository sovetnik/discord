class Model
  attr_reader :entity
  def initialize entity
    @entity = entity
  end

  def sentence
    "where exist #{entity.name}"
  end
end
