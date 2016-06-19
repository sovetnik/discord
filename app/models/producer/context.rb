class Context
  # Something that determine variant after bifurcation
  # it is a condition Entity

  # in view:
  ## in preamble: nothing
  ## in details: name & desc
  ## in layer_tabs: none

  # in tree: persist as entity
  # in code: nothing
  # in spec: generates context with same name
  # in filesystem: nothing

  attr_reader :entity
  def initialize(entity)
    @entity = entity
  end

  def child_kinds
    %w(Context)
  end

  def sentence
    "when #{entity.name}"
  end

  def generate_code
    head = "context '#{entity.name}' do"
    tail = "\nend"
    [head, tail]
  end

  def has_dependencies?
    false
  end
end
