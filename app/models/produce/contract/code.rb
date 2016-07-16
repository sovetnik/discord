# frozen_string_literal: true
# frozen_string_literal: true
class Produce::Contract::Code
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_code
    [path_line, head_line, concretes_code, abilities_code, footer_code]
  end

  private

  def concretes_code
    cc = ['# You must redefine this method in', '# listed concrete layers:']
    concretes_names.each { |name| cc << "# #{name}" }
    cc
  end

  def concretes_names
    repo.concretes.collect(&:name)
  end

  def path_line
    "# ~/#{repo.producer.full_path}/#{repo.name.underscore}.rb\n"
  end

  def head_line
    "class #{repo.parent.name}::#{repo.name}"
  end

  def abilities_code
    code = repo.children.guaranties.collect { |i| i.producer.to_ruby }
    code.flatten 1
  end

  def footer_code
    "end\n"
  end
end
