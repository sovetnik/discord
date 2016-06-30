# frozen_string_literal: true
module Produce
  class Model < ConcreteProducer
    # Reflection on real world concept, which have identity

    # in view:
    ## in preamble: sentence
    ## in details: name & desc
    ## in layer_tabs: layers

    # in code: module
    # in spec: folder (or file if model is very compact)
    # in filesystem: is folder (or file if model is very compact)

    def child_kinds
      %w(Layer Ability)
    end

    def sentence
      "where exist #{repo.name}"
    end

    def generate_code
      [head_line, abilities_code, 'end']
    end

    def addictable?
      true
    end

    private

    def head_line
      "module #{repo.parent.name}::"
    end

    def path_line
      "# ~/#{repo.producer.full_path}/#{repo.name.underscore}/*\n"
    end

    def const_name
      [repo.parent.producer.const_name, repo.name].join '::'
    end

    def abilities_code
      code = repo.children.layers.collect { |i| i.producer.generate_code }
      code.flatten(1)
    end
  end
end
