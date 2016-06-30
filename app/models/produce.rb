# frozen_string_literal: true
module Produce
  REPO = Struct.new 'Repo', :repo

  class ConcreteProducer < REPO
    def to_tree
      possible_childs.unshift self.class
    end

    def indented_tree
      indent_code(to_tree).join("\n")
    end

    private

    def indent_code(unindented_array, depth = 0)
      indented_array = []
      unindented_array.each do |element|
        case element
        when Class
          indented_array << indent_line(element.name, depth)
        when Array
          indented_array << indent_code(element, (depth + 2))
        end
      end
      indented_array.flatten
    end

    def indent_line(line, depth = 0)
      ' ' * depth + line
    end

    def possible_childs
      child_kinds.compact.map { |ck| full_kind(ck).constantize.new.to_tree }
    end

    def full_kind(kind)
      'Produce::' + kind
    end
  end
end
