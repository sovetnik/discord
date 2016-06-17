class Layer
  # Point of view what encapsulate some kind of model responsibilities

  # in view:
  ## in preamble: nothing
  ## in details: name & desc
  ## in layer_tabs: none

  # in tree: persist as entity
  # in code: class
  # in spec: file with root describe
  # in filesystem: is file

  attr_reader :entity
  def initialize(entity)
    @entity = entity
  end

  def sentence
    "from #{entity.name} point of view"
  end

  def has_dependencies?
    true
  end

  def possibly_deps
    depends = []
    root.descendants.where(kind: kind).each do |entity|
      depends << Depend.new(entity, addict?(entity))
    end
    depends
  end
end
