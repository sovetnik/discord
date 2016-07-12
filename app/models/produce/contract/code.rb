# frozen_string_literal: true
class Produce::Contract::Code
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_code
    [path_line, head_line, abilities_code, footer_code]
  end

  private

  def path_line
    "# ~/#{repo.producer.full_path}/#{repo.name.underscore}.rb\n"
  end

  def head_line
    "class #{repo.parent.name}::#{repo.name}"
  end

  def abilities_code
    code = repo.children.abilities.collect { |i| i.producer.generate_code }
    code.flatten 1
  end

  def footer_code
    "end\n"
  end
end
