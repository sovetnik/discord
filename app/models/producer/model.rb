class Model
  attr_reader :object
  def initialize(object)
    @object = object
  end

  def sentence
    "where exist #{object.name}"
  end

  def has_dependencies?
    false
  end
end
