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
    path = entity.producer.full_path
    head = "module #{entity.parent.name}::"
    [path, head, inferences_code, 'end']
  end

  def const_name
    [entity.parent.producer.const_name, entity.name].join '::'
  end

  def addictable?
    true
  end

  private

  def inferences_code
    code = entity.children.layers.collect { |i| i.producer.generate_code }
    code.flatten(1)
  end
end
