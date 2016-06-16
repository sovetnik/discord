class Model
  # Reflection on real world concept, which have identity

  # in code module
  # in spec folder (or file if model is very compact)
  # in filesystem is folder (or file if model is very compact)

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
