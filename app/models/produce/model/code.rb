# frozen_string_literal: true
class Produce::Model::Code
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_code
    [head_line, 'end']
  end

  def generate_path
    "# ~/#{repo.producer.full_path}/#{repo.name.underscore}/*\n"
  end

  private

  def module_name
    repo.self_and_ancestors.models.reverse.collect(&:name).join '::'
  end #  => ["Chaos", "Message"]

  def head_line
    "module #{module_name}"
  end
end
