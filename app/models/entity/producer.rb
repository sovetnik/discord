# frozen_string_literal: true
module Entity
  class Producer
    attr_reader :repo

    def initialize(repo)
      @repo = repo
    end

    def child_kinds
      concrete_producer.child_kinds
    end

    def sentence
      concrete_producer.sentence
    end

    def depends
      repo.deps[kind.underscore]
    end

    def addictable?
      concrete_producer.addictable?
    end

    def const_name
      concrete_producer.const_name
    end

    def get_code
      indent_code(generate_code).join("\n")
    end

    def generate_code
      concrete_producer.generate_code
    end

    def full_path
      '# apps/web/config/routes.rb'
    end

    def dep_code
      concrete_producer.dep_code
    end

    private

    def concrete_producer
      safe_kind.constantize.new repo
    end

    def safe_kind
      KINDS.include?(repo.kind) ? repo.kind : 'Aught'
    end

    def indent_code(unindented_array, depth = 0)
      indented_array = []
      unindented_array.each do |element|
        case element
        when String
          indented_array << indent_line(element, depth)
        when Array
          indented_array << indent_code(element, (depth + 2))
        end
      end
      indented_array.flatten
    end

    def indent_line(line, depth = 0)
      ' ' * depth + line
    end
  end
end
