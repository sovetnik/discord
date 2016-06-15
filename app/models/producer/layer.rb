class Layer
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
