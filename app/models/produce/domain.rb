# frozen_string_literal: true
module Produce
  class Domain < ConcreteProducer
    def to_ruby
      []
    end

    def to_ruby_path
      ''
    end

    def to_spec
      ["describe #{repo.name}"]
    end

    def child_kinds
      %w(Story Model Domain)
    end

    def sentence
      "Let's take a look on #{repo.name}"
    end

    def const_name
      nil
    end

    def abstractable?
      false
    end

    def path_line
      "# ~/#{repo.producer.full_path}#{repo.name.underscore}/*\n"
    end
  end
end
