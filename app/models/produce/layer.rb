# frozen_string_literal: true
module Produce
  class Layer < ConcreteProducer
    # Point of view what encapsulate some kind of model responsibilities

    # in code: class
    # in spec: file with root describe
    # in filesystem: is file

    def child_kinds
      %w(Aught Ability)
    end

    def sentence
      "from #{repo.name} point of view"
    end

    def generate_code
      [path_line, head_line, addicts_code, abilities_code, footer_code]
    end

    def addictable?
      true
    end

    private

    def path_line
      "# ~/#{repo.producer.full_path}/#{repo.name.underscore}.rb\n"
    end

    def head_line
      "class #{repo.parent.name}::#{repo.name}"
    end

    def addicts_list
      addicts = []
      repo.addicts_exist.collect(&:name).each do |ad|
        addicts << (':' + ad.underscore)
      end
      addicts
    end

    def addicts_code
      ["open_layers #{addicts_list.join(', ')}\n"] if addicts_list.any?
    end

    def abilities_code
      code = repo.children.abilities.collect { |i| i.producer.generate_code }
      code.flatten 1
    end

    def footer_code
      "end\n"
    end
  end
end
