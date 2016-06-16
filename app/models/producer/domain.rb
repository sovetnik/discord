class Domain
  # Something that describe root level concept
  # it is a root Entity

  # in tree persist as entity
  # in code module
  # in spec nothing
  # in filesystem folder

  attr_reader :entity
  def initialize(entity)
    @entity = entity
  end

  def sentence
    "Let's take a look on #{entity.name}"
  end

  def has_dependencies?
    false
  end
end
