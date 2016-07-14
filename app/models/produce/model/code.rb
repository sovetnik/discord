# frozen_string_literal: true
class Produce::Model::Code
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_code
    [head_line, layers_code, 'end']
  end

  private

  def module_name
    repo.self_and_ancestors.models.reverse.collect(&:name).join '::'
  end #  => ["Chaos", "Message"]

  def head_line
    "module #{module_name}"
  end

  def const_name
    [repo.parent.producer.const_name, repo.name].join '::'
  end

  def layers_code
    code = repo.children.layers.collect { |l| l.producer.to_ruby }
    code.flatten(1)
  end
end
