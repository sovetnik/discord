# frozen_string_literal: true
module Produce
  class Axiom < ConcreteProducer
    # it is a source for ability

    # in code: method dependency, from same class (private),
    # from opened layers (common) or from abstract layers (contracts)
    # in spec: generates let
    # in filesystem: nothing

    def child_kinds
      %w(Aught)
    end

    def sentence
      "Should supply #{repo.desc} and return #{repo.name}"
    end

    def generate_code
      ['# axiom: layer.ability']
      # ["def #{repo.name}#{args_list}", addicts_code, "end\n"]
    end

    def addictable?
      true
    end

    def dep_code
      "# #{repo.parent.name.underscore}.#{repo.name.underscore}"
    end

    def args_list
      list = []
      repo.addicts_exist.each do |addict|
        unless repo.parent.producer.addicts_list['layer'].include? addict.parent.id
          list << addict.parent.name
        end
      end
      line = list.map(&:underscore).uniq.join ', '
      line.empty? ? '' : "(#{line})"
    end

    def addicts_code
      addicts = []
      repo.addicts_exist.collect(&:producer).each do |ad|
        addicts << ad.dep_code
      end
      addicts
    end
  end
end
