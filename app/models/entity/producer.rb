module Entity
  class Producer
    # at this time producer depends only on
    # kind attribute method of passed object
    # but concrete_producer depends on method #name on passed object
    # so, we have two interface dependencies in object to work with him

    # depends_on :kind, :name

    attr_reader :repo
    def initialize(repo)
      @repo = repo
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

    private

    def concrete_producer
      repo.kind.constantize.new repo
    end
  end
end
