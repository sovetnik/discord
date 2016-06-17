module Entity
  class Producer
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

    def get_code
      code = %{
        def get_code
          code = <<-GETCODE
            def initialize(repo)
              @repo = repo
            end
          GETCODE
          formatter = Rouge::Formatters::HTML.new
          lexer = Rouge::Lexers::Ruby.new
          formatter.format(lexer.lex(code))
        end
      }
    end

    private

    def concrete_producer
      repo.kind.constantize.new repo
    end
  end
end
