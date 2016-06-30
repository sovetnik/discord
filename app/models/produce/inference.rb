# frozen_string_literal: true
module Produce
  class Inference < ConcreteProducer
    # TODO: Write details about responsibility
    # Responsibility
    # it is a root Entity

    # in view:
    ## in preamble: sentence
    ## in details: name & desc
    ## block of def ... ... end with argument, deps & result
    ## in layer_tabs#  none

    # in tree: persist as repo
    # in code: method with same name, including
    # argument(zero or several), dependencies(several) and result(one or more)
    # in spec: generates describe
    # in filesystem: nothing

    def child_kinds
      []
      # %w(Aught Inference)
    end

    def sentence
      "Should obey #{repo.name} and return described result"
    end

    def generate_code
      ["def #{repo.name}#{args_list}", addicts_code, "end\n"]
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
