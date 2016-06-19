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

    def has_dependencies?
      concrete_producer.has_dependencies?
    end

    def get_code
      concrete_producer.generate_code.join("\n")
    end

    private

    def concrete_producer
      repo.kind.constantize.new repo
    end
  end
end
