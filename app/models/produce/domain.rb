# frozen_string_literal: true
module Produce
  class Domain < ConcreteProducer
    # Something that describe root level concept
    # it is a root Entity

    # in code: module
    # in spec: folder
    # in filesystem: folder

    def child_kinds
      %w(Aught Story Contract Model Domain)
    end

    def sentence
      "Let's take a look on #{repo.name}"
    end

    def generate_code
      [path_line]
    end

    def const_name
      nil
    end

    def addictable?
      false
    end

    private

    def path_line
      "# ~/#{repo.producer.full_path}#{repo.name.underscore}/*\n"
    end
  end
end
