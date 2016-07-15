# frozen_string_literal: true
module Entity
  class Picker < Struct.new 'Picker', :repo, :producer
    def possibly_kinds
      return ['Domain'] if repo.parent_id.nil?
      Entity::KINDS & repo.parent.producer.child_kinds
    end

    def possibly_child_kinds
      Entity::KINDS & producer.child_kinds
    end

    def possibly_abstract_list
      repo.root.descendants.where(kind: producer.abstract_kind)
    end

    def kinds_list
      possibly_kinds.map.with_index { |obj, index| [index, obj] }
    end

    def child_kinds_list
      possibly_child_kinds.map.with_index { |obj, index| [index, obj] }
    end
  end
end
