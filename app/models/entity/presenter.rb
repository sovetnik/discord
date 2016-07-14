# frozen_string_literal: true
module Entity
  class Presenter < Struct.new 'Presenter', :repo, :producer
    def builded_context
      producer.possibly_contexts.each do |line|
        repo.children.find_or_initialize_by(name: line.join(' and '), kind: 'Context')
      end
      repo.children.to_a.keep_if { |c| c.kind == 'Context' }
    end

    def build_context?
      repo.kind == 'Ability'
    end

    def stories
      repo.root.descendants.stories
    end

    def sentences
      repo.ancestors.reverse.collect(&:producer).map(&:sentence)
    end

    def sentence
      producer.sentence
    end

    def description
      repo.desc
    end

    def inheritance_tree
      indent(producer.to_tree)
    end

    def path_line
      producer.path_line
    end

    def produced_code
      indent(producer.to_ruby)
    end

    def produced_spec
      indent(producer.generate_spec)
    end

    def abstractable?
      producer.abstractable?
    end

    def sentences?
      !repo.root?
    end

    def hash_tree
      repo.root.hash_tree
    end

    private

    def indent(unindented_array, depth = 0)
      indented_array = []
      unindented_array.each do |element|
        indented_array << if element.class == Array
                            indent(element, (depth + 2))
                          else
                            indent_line(element.to_s, depth)
                          end
      end
      indented_array.flatten.join("\n")
    end

    def indent_line(line, depth = 0)
      ' ' * depth + line
    end
  end
end
