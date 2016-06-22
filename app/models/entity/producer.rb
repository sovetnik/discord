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

    def addictable?
      concrete_producer.addictable?
    end

    def get_code
      concrete_producer.generate_code.join("\n")
    end

    def dep_code
      concrete_producer.dep_code
    end

    private

    def concrete_producer
      safe_kind.constantize.new repo
    end

    def safe_kind
      KINDS.include?(repo.kind) ? repo.kind : 'Aught'
    end
  end
end
