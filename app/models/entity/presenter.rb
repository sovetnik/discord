# frozen_string_literal: true
module Entity
  class Presenter < Struct.new 'Presenter', :repo, :producer
    extend Forwardable
    # def_delegators :concrete_producer

    def stories
      repo.root.descendants.stories
    end

    def context_sentences
      repo.root.ancestors.reverse.collect(&:producer).map(&:sentence)
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

    def produced_code
      indent(producer.generate_code)
     end

    def abstractable?
      producer.abstractable?
    end

    def context_sentences?
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