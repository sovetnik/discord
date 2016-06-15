class Inference
  attr_reader :entity
  def initialize(entity)
    @entity = entity
  end

  def sentence
    "Should obey #{entity.name} and return described result"
  end

  def has_dependencies?
    true
  end
end
