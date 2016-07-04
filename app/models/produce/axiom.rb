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
      [axiom_line]
    end

    def addictable?
      true
    end

    private

    def axiom_line
      repo.abstract.nil? ? repo.name : inference_line
    end

    def inference_line
      "# #{repo.abstract.parent.parent.name}.#{repo.abstract.parent.name} => #{repo.abstract.name}"
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
  end
end
