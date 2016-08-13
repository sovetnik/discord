# frozen_string_literal: true
class Produce::Layer::Spec
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_spec
    [head_line, abilites_lines, 'end']
  end

  def head_line
    "Rspec.describe  #{module_name}::#{repo.name} do"
  end

  def module_name
    repo.ancestors.models.reverse.collect(&:name).join '::'
  end #  => ["Chaos", "Message"]

  def abilites_lines
    repo.descendants.abilities.flat_map(&:producer).flat_map(&:to_spec)
  end
end
