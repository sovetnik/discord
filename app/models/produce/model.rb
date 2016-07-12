# frozen_string_literal: true
module Produce
  class Model < ConcreteProducer
    # Reflection on real world concept, which have identity

    # in code: module
    # in spec: folder (or file if model is very compact)
    # in filesystem: is folder (or file if model is very compact)

    def child_kinds
      %w(Layer Model)
    end

    def sentence
      "where exist #{repo.name}"
    end

    def generate_code
      [head_line, layers_code, 'end']
    end

    def generate_spec
      ["describe #{repo.name}"]
    end

    def abstractable?
      false
    end

    def module_name
      repo.self_and_ancestors.models.reverse.collect(&:name).join '::'
    end #  => ["Chaos", "Message"]

    def path_line
      "# ~/#{repo.producer.full_path}/#{repo.name.underscore}/*\n"
    end

    private

    def head_line
      "module #{module_name}"
    end

    def const_name
      [repo.parent.producer.const_name, repo.name].join '::'
    end

    def layers_code
      code = repo.children.layers.collect { |l| l.producer.generate_code }
      code.flatten(1)
    end
  end
end
