# frozen_string_literal: true
class Produce::Inference::Spec
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_spec
    [head_line, content_lines, 'end']
  end

  def generate_stub
    "allow(#{layer_name}).to receive(:#{ability_name}).and_return(#{repo.name})"
  end

  def head_line
    "it \"returnes #{repo.name}\" do"
  end

  def content_lines
    ["expect(subject.#{ability_name}).to equal(#{repo.name})"]
  end

  def ability_name
    repo.ancestors.abilities.first.name
  end

  def layer_name
    repo.ancestors.layers.first.name.underscore
  end
end
