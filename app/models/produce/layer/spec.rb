# frozen_string_literal: true
class Produce::Layer::Spec
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_spec
    [head_line, subject_line, abilites_lines, 'end']
  end

  def head_line
    "Rspec.describe  #{subject_name} do"
  end

  def subject_line
    "let(:subject) { #{subject_name}.new }"
  end

  def abilites_lines
    repo.descendants.abilities.flat_map(&:producer).flat_map(&:to_spec)
  end

  def subject_name
    [module_name, repo.name].join('::')
  end

  def module_name
    repo.ancestors.models.reverse.collect(&:name).join '::'
  end #  => ["Chaos", "Message"]
end
