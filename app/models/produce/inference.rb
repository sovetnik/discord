# frozen_string_literal: true
module Produce
  class Inference < ConcreteProducer
    # Result and meaning for ability

    # in code: method
    # in spec: expectation( it )
    # in filesystem: nothing

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
