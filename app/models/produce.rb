# frozen_string_literal: true
module Produce
  REPO = Struct.new 'Repo', :repo

  class ConcreteProducer < REPO
    def indented_tree
      indent_tree(to_tree).join("\n")
    end

    def to_tree
      expanded_childs.unshift self.class
    end

    private

    def indent_tree(unindented_array, depth = 0)
      indented_array = []
      unindented_array.each do |element|
        case element
        when Class
          indented_array << indent_line(element.name, depth)
        when Array
          indented_array << indent_tree(element, (depth + 2))
        end
      end
      indented_array.flatten
    end

    def indent_line(line, depth = 0)
      ' ' * depth + line
    end

    def expanded_childs
      possible_childs.map { |ch| expand_child ch }
    end

    def possible_childs
      child_kinds.map { |ck| full_kind(ck).constantize.new }
    end

    def expand_child(child)
      recursive_child?(child) ? [child.class] : child.to_tree
    end

    def recursive_child?(child)
      child.class == self.class
    end

    def full_kind(kind)
      'Produce::' + kind
    end
  end
end
