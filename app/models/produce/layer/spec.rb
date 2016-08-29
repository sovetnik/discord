# frozen_string_literal: true
class Produce::Layer::Spec
  attr_reader :producer

  def initialize(producer)
    @producer = producer
  end

  def generate_path
    "\"\#\{Rails.root\}/spec/lib/#{producer.dynamic_path}_spec.rb\""
  end

  def generate_spec
    [helper_line, require_line, head_line, subject_line, abilites_lines, 'end']
  end

  def helper_line
    "require 'rails_helper'"
  end

  def require_line
    "require \"\#\{Rails.root\}/lib/#{producer.dynamic_path}\"\n"
  end

  def head_line
    "describe  #{subject_name} do"
  end

  def subject_line
    if producer.stocks.any?
      "let(:subject) { described_class.new(#{args_line}) }"
    else
      'let(:subject) { described_class.new }'
    end
  end

  def args_line
    producer.stocks.collect(&:title).map(&:underscore).join(', ')
  end

  def abilites_lines
    producer.abilities.flat_map(&:producer).flat_map(&:to_spec)
  end

  def subject_name
    producer.reverse_ancestry.join('::')
  end
end
