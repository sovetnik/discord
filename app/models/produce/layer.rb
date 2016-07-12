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

    def path_line
      "# ~/#{[repo.producer.full_path, repo.name.underscore].join('/')}.rb\n"
    end

    def generate_spec
      ["describe #{repo.name}"]
    end

    def to_ruby
      Code.new(repo).generate_code
    end

    def abstractable?
      true
    end

    def abstract_kind
      'Contract'
    end
  end
end
