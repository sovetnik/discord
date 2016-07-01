# frozen_string_literal: true
module Entity
  class Addict
    # Ability or layer dependency
    # it is a leaf entity

    # in tree: persist as deps in hash like
    # in code: dependency line
    # in spec: maybe let ?
    # in filesystem: nothing

    attr_reader :entity, :addictance
    def initialize(entity, addictance = 1)
      @entity = entity
      @addictance = addictance
    end

    def id
      entity.id
    end

    def layer_id
      entity.layer_id
    end

    def code
      "  # #{entity.parent.name}.#{entity.name}"
    end

    # TODO: this is like a shit
    def name
      "#{entity.kind}:#{entity.name}"
    end

    def addicted?
      addictance != 0
    end

    # used from dependency_form
    def persisted?
      true
    end
  end
end
