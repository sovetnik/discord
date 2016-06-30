# frozen_string_literal: true
module Produce
  class Domain < ConcreteProducer
    # Something that describe root level concept
    # it is a root Entity

    # in view:
    ## in preamble: sentence
    ## in details: name & desc & children
    ## in layer_tabs: none

    # in tree: persist as entity
    # in code: module
    # in spec: nothing
    # in filesystem: folder

    def child_kinds
      %w(Aught Story Model)
    end

    def sentence
      "Let's take a look on #{repo.name}"
    end

    def generate_code
      []
    end

    def const_name
      nil
    end

    def addictable?
      false
    end
  end
end
