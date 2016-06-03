class Domain
  attr_reader :entity
  def initialize entity
    @entity = entity
  end

  def sentence
    "Let's take a look on #{entity.name}"
  end
end
