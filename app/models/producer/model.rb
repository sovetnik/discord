class Model
  # Reflection on real world concept, which have identity

  # in view:
  ## in preamble: sentence
  ## in details: name & desc
  ## in layer_tabs: layers

  # in code: module
  # in spec: folder (or file if model is very compact)
  # in filesystem: is folder (or file if model is very compact)

  attr_reader :entity
  def initialize(entity)
    @entity = entity
  end

  def child_kinds
    %w(Layer Model Inference)
  end

  def sentence
    "where exist #{entity.name}"
  end

  def generate_code
    head = "class #{entity.parent.name}::#{entity.name}"
    inferences_code = entity.children.inferences.collect { |i| i.producer.get_code }
    body = inferences_code.flatten.map! { |i| '  ' + i }
    tail = 'end'
    [head, body, tail]
  end

  def name
    entity.name
  end

  def has_dependencies?
    true
  end
end
