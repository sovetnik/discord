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

  def child_kinds
    %w(Aught Inference)
  end

  def sentence
    "Should obey #{entity.name} and return described result"
  end

  def generate_code
    ["  def #{entity.name}(args)", depends_code, '  end']
  end

  def depends_code
    depends = []
    entity.possibly_deps.each do |dep|
      depends << ('  ' + dep.code) if dep.addict?
    end
    depends
  end

  def addictable?
    true
  end
end
