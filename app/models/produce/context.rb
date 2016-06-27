# frozen_string_literal: true
module Produce
  class Context < REPO
    # Something that determine variant after bifurcation
    # it is a condition Entity

    # in view:
    ## in preamble: nothing
    ## in details: name & desc
    ## in layer_tabs: none

    # in tree: persist as entity
    # in code: nothing
    # in spec: generates context with same name
    # in filesystem: nothing

    def child_kinds
      %w(Context)
    end

    def sentence
      "when #{repo.name}"
    end

    def generate_code
      ["context '#{repo.name}' do"]
    end

    def addictable?
      false
    end
  end
end
