# frozen_string_literal: true
module Produce
  class Layer < ConcreteProducer
    # Generation
    def to_ruby
      Code.new(self).generate_code
    end

    def to_ruby_path
      "#{Rails.root}/lib/#{dynamic_path}.rb"
    end

    def to_spec
      Spec.new(self).generate_spec
    end

    def to_spec_path
      Spec.new(self).generate_path
    end

    def child_kinds
      %w(Ability Stock)
    end

    def sentence
      "as #{repo.name}"
    end

    def abstractable?
      true
    end

    def abstract_kind
      'Layer'
    end

    def module_name
      repo.ancestors.pluck(:name).reverse.join '::'
    end

    def layer_name
      repo.name.camelize
    end

    def dynamic_path
      reverse_ancestry.map(&:underscore).join('/')
    end

    # Relations

    def abilities
      repo.children.abilities
    end

    def stocks
      repo.children.stocks
    end

    def reverse_ancestry
      repo.self_and_ancestors.collect(&:name).reverse
    end
  end
end
