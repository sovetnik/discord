# frozen_string_literal: true
module Produce
  REPO = Struct.new 'Repo', :repo

  class ConcreteProducer < REPO
    def to_tree
      expanded_childs.unshift self.class
    end

    def full_path
      repo.ancestors.collect(&:name).reverse.map(&:underscore).join('/')
    end # => 'domain/model/layer'

    private

    def expanded_childs
      possible_childs.map { |ch| expand_child ch }
    end

    def possible_childs
      child_kinds.map { |ck| full_kind(ck).constantize.new }
    end

    def expand_child(child)
      recursive_child?(child) ? [child.class] : child.to_tree
    end

    def recursive_child?(child)
      child.class == self.class
    end

    def full_kind(kind)
      'Produce::' + kind
    end
  end
end
