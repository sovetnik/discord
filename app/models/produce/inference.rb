# frozen_string_literal: true
module Produce
  class Inference < ConcreteProducer
    # Reflection on real world concept, which have identity

    # in view:
    ## in preamble: sentence
    ## in details: name & desc
    ## in layer_tabs: layers

    # in code: module
    # in spec: folder (or file if model is very compact)
    # in filesystem: is folder (or file if model is very compact)

    def child_kinds
      []
      # %w(Layer Ability)
    end

    def sentence
      "Should return #{repo.name}, #{repo.name}"
    end

    def generate_code
      ["# => #{repo.name.underscore}"]
    end

    def addictable?
      true
    end

    private

    def path_line
      "# ~/#{repo.producer.full_path}/#{repo.name.underscore}/*\n"
    end
  end
end
