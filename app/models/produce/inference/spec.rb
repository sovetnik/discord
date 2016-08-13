# frozen_string_literal: true
class Produce::Inference::Spec
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_spec
    [head_line, content_lines, 'end']
  end

  def head_line
    "it 'returnes #{repo.name}'"
  end

  def content_lines
    ["expect(#{layer_name}.#{ability_name}).to equal(#{repo.name})"]
  end

  def ability_name
    repo.ancestors.abilities.first.name
  end

  def layer_name
    repo.ancestors.layers.first.name.underscore
  end
end
