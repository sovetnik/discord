# frozen_string_literal: true
module Entity
  class Producer < Struct.new 'Producer', :repo
    def self.wrap(repo)
      new(repo).build_concrete_producer
    end

    def build_concrete_producer
      full_kind.constantize.new repo
    end

    private

    def full_kind
      'Produce::' + safe_kind
    end

    def safe_kind
      KINDS.include?(repo.kind) ? repo.kind : 'Aught'
    end
  end
end
