# frozen_string_literal: true
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
    [head_line, inferences_code, 'end']
  end

  def addictable?
    true
  end

  private

  def head_line
    "module #{entity.parent.name}::"
  end

  def path_line
    "# ~/#{entity.producer.full_path}/#{entity.name.underscore}/*\n"
  end

  def const_name
    [entity.parent.producer.const_name, entity.name].join '::'
  end

  def inferences_code
    code = entity.children.layers.collect { |i| i.producer.generate_code }
    code.flatten(1)
  end
end
