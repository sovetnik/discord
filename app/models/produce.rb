# frozen_string_literal: true
module Produce
  REPO = Struct.new 'Repo', :repo

  class ConcreteProducer < REPO

    def to_tree
      possible_childs.unshift self.class
    end

    private

    def possible_childs
      child_kinds.compact.map { |ck| full_kind(ck).constantize.new.to_tree}
    end

    def full_kind kind
      'Produce::' + kind
    end
  end
end
