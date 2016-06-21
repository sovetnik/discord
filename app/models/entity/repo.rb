# frozen_string_literal: true
module Entity
  class Repo < ActiveRecord::Base
    self.table_name = 'entities'
    acts_as_tree order: 'sort_order'

    scope :inferences, -> { where(kind: 'Inference') }
    scope :layers, -> { where(kind: 'Layer') }
    scope :stories, -> { where(kind: 'Story') }

    attr_accessor :addictance

    ## way to abstract & producer layer
    def abstract
      Abstract.new self
    end

    def producer
      Producer.new self
    end

    def layer
      self.class.layers.find(layer_id) if layer_id
    end

    def possibly_kinds
      return ['Domain'] if parent_id.nil?
      Entity::KINDS & parent.producer.child_kinds
    end

    def possibly_child_kinds
      Entity::KINDS & producer.child_kinds
    end

    def kinds_list
      possibly_kinds.map.with_index { |obj, index| [index, obj] }
    end

    def child_kinds_list
      possibly_child_kinds.map.with_index { |obj, index| [index, obj] }
    end

    ## Possible values to collection select & validation
    def parents_list
      self.class.all
    end

    def add_child(params)
      children.create(params)
    end

    ## kind num getter
    def kind_num
      possibly_kinds.rindex kind
    end

    ## kind setter by num
    def kind_num=(num)
      self.kind = possibly_kinds[num.to_i] || ''
    end

    def layers_list
      list = []
      list << parent&.siblings&.layers unless parent&.root?
      list << siblings.layers unless root?
      list.flatten.compact.uniq
    end

    def addicts
      addicts = []
      root.descendants.where(kind: kind).each do |entity|
        addicts << Depend.new(entity, addicted?(entity))
      end
      addicts
    end

    def addicts_attributes=(atts)
      addict_ids = []
      atts.keys.each do |key|
        addict_ids << atts.dig(key, 'id') if atts.dig(key, 'addictance') != '0'
      end
      self.addict = {} if addict.nil?
      self.addict = { kind.underscore.to_sym => addict_ids.map!(&:to_i) }
    end

    private

    def addicted?(entity)
      self.addict = { kind.underscore => [] } if addict.nil?
      addict.fetch(kind.underscore, []).include?(entity.id) ? 1 : 0
    end
  end
end
