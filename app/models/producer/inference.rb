# frozen_string_literal: true
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
    ["def #{entity.name}#{args_list}", addicts_code, "end\n"]
  end

  def addictable?
    true
  end

  def dep_code
    "# #{entity.parent.name.underscore}.#{entity.name.underscore}"
  end

  def args_list
    list = []
    entity.addicts_exist.each do |addict|
      unless entity.parent.producer.addicts_list["layer"].include? addict.parent.id
        list << addict.parent.name
      end
    end
    line = list.map(&:underscore).uniq.join ', '
    line.empty? ? '' : "(#{line})"
  end

  def addicts_code
    addicts = []
    entity.addicts_exist.each do |ad|
      addicts << ad.producer.dep_code
    end
    addicts
  end
end
