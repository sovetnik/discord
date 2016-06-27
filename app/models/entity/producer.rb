# frozen_string_literal: true
module Entity
  class Producer < Struct.new 'Producer', :repo
    extend Forwardable
    def_delegators :concrete_producer,
                   :child_kinds,
                   :sentence,
                   :addictable?,
                   :const_name,
                   :generate_code,
                   :dep_code

    def addicts_list
      repo.addict if addictable?
    end

    def get_code
      indent_code(generate_code).join("\n")
    end

    def full_path
      repo.ancestors.collect(&:name).reverse.map(&:underscore).join('/')
    end # => 'domain/model/layer'

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
