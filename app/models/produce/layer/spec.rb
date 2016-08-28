# frozen_string_literal: true
class Produce::Layer::Spec
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_path
    "\"\#\{Rails.root\}/spec/lib/#{repo.producer.dynamic_path}_spec.rb\""
  end

  def generate_spec
    [helper_line, require_line, head_line, subject_line, abilites_lines, 'end']
  end

  def helper_line
    "require 'rails_helper'"
  end

  def require_line
    "require \"\#\{Rails.root\}/lib/#{repo.producer.dynamic_path}\"\n"
  end

  def head_line
    "describe  #{subject_name} do"
  end

  def subject_line
    if repo.children.stocks.any?
      "let(:subject) { described_class.new(#{args_line}) }"
    else
      'let(:subject) { described_class.new }'
    end
  end

  def args_line
    repo.children.stocks.collect(&:title).map(&:underscore).join(', ')
  end

  def abilites_lines
    repo.descendants.abilities.flat_map(&:producer).flat_map(&:to_spec)
  end

  def subject_name
    repo.producer.reverse_ancestry.join('::')
  end
end
