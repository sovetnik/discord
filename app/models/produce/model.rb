# frozen_string_literal: true
module Produce
  class Model < ConcreteProducer
    # Reflection on real world concept, which have identity

    # in code: module
    # in spec: folder (or file if model is very compact)
    # in filesystem: is folder (or file if model is very compact)

    def child_kinds
      %w(Layer Model Contract)
    end

    def sentence
      "where exist #{repo.name}"
    end

    def generate_spec
      ["describe #{repo.name}"]
    end

    def to_ruby
      Code.new(repo).generate_code
    end

    def abstractable?
      false
    end

    def module_name
      Code.new(repo).generate_code
    end #  => ["Chaos", "Message"]

    def path_line
      "# ~/#{repo.producer.full_path}/#{repo.name.underscore}/*\n"
    end
  end
end
