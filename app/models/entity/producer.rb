# frozen_string_literal: true
module Entity
  class Producer < Struct.new 'Producer', :repo
    extend Forwardable
    def_delegators :concrete_producer,
                   :child_kinds,
                   :sentence,
                   :const_name,
                   :generate_spec,
                   :path_line,
                   :to_ruby,
                   :to_tree,
                   :abstract_kind,
                   :abstractable?

    def full_path
      repo.ancestors.collect(&:name).reverse.map(&:underscore).join('/')
    end # => 'domain/model/layer'

    private

    def concrete_producer
      full_kind.constantize.new repo
    end

    def full_kind
      'Produce::' + safe_kind
    end

    def safe_kind
      KINDS.include?(repo.kind) ? repo.kind : 'Aught'
    end
  end
end
