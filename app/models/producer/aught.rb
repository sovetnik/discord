class Aught
  # Something we can differ against others
  # it is a basic Entity

  # in view:
  ## in preamble: sentence
  # TODO: Preamble creates context. Describe our entity.
  ## in info: name & desc
  ## in layer_tabs:  none

  # in tree persist: as entity
  # in code: nothing
  # in spec: nothing
  # in filesystem: nothing

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
