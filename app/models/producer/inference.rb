class Inference
  # TODO: Write details about responsibility
  # Responsibility
  # it is a root Entity

  # in view:
  ## in preamble: sentence
  ## in details: name & desc
  ## block of def ... ... end with argument, deps & result
  ## in layer_tabs#  none

  # in tree: persist as entity
  # in code: method with same name, including
  # argument(zero or several), dependencies(several) and result(one or more)
  # in spec: generates describe
  # in filesystem: nothing

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
