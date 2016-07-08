# frozen_string_literal: true
module Produce
  class Layer < ConcreteProducer
    # Point of view what encapsulate some kind of model responsibilities

    # in code: class
    # in spec: file with root describe
    # in filesystem: is file

    def child_kinds
      %w(Ability Stock)
    end

    def sentence
      "from #{repo.name} point of view"
    end

    def generate_code
      [path_line, head_line, stocks_line, abilities_code, footer_code]
    end

    def abstractable?
      true
    end

    def abstract_kind
      'Contract'
    end

    private

    def path_line
      "# ~/#{[repo.producer.full_path, repo.name.underscore].join('/')}.rb\n"
    end

    def head_line
      "class #{repo.parent.name}::#{repo.name}"
    end

    def stocked_layers
      stocks = []
      repo.children.stocks.collect(&:name).each do |stock|
        stocks << (':' + stock.underscore)
      end
      stocks
    end

    def stocks_line
      ["open_layers #{stocked_layers.join(', ')}\n"] if stocked_layers.any?
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
