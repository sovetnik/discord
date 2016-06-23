# frozen_string_literal: true
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

  def child_kinds
    %w(Aught Inference)
  end

  def sentence
    "from #{entity.name} point of view"
  end

  def generate_code
    [head, addicts_code, inferences_code, 'end']
  end

  def addictable?
    true
  end

  private

  def head
    "class #{entity.parent.name}::#{entity.name}"
  end

  def addicts_code
    addicts = []
    entity.addicts_exist.each do |ad|
      addicts << (':' + ad.name.underscore)
    end
    ["open_layers #{addicts.join(', ')}\n"]
  end

  def inferences_code
    code = entity.children.inferences.collect { |i| i.producer.generate_code }
    code.flatten 1
  end
end
