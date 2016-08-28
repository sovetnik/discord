# frozen_string_literal: true
class Produce::Ability::Spec
  attr_reader :producer

  def initialize(producer)
    @producer = producer
  end

  def generate_spec
    ["describe '##{producer.repo.name}' do", context_spec, 'end']
  end

  def axiom_spec
    producer.axioms.flat_map(&:producer).flat_map(&:to_spec)
  end

  def context_spec
    producer.child_contexts.flat_map(&:producer).flat_map(&:to_spec)
  end
end
