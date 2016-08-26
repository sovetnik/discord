# frozen_string_literal: true
class Produce::Layer::Code
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_code
    [module_line, [head_line, [init_lines, abilities_code], 'end'], 'end']
  end

  private

  def module_line
    "module #{module_name}"
  end

  def head_line
    "class #{repo.name}"
  end

  def init_lines
    if stocked_names.any?
      [attr_line,
       "def initialize(#{stocked_names.join(', ')})",
       variables_lines,
       "end\n"]
    else
      []
    end
  end

  def attr_line
    "attr_reader #{stocked_symbols.join(', ')}\n"
  end

  def variables_lines
    stocked_names.map { |name| "@#{name} = #{name}" }
  end

  def module_name
    repo.ancestors.models.reverse.collect(&:name).join '::'
  end

  def stocked_symbols
    stocked_names.map { |s| ':' + s.underscore }
  end

  def stocked_names
    repo.children.stocks.collect(&:title)
  end

  def abilities_code
    code = repo.children.abilities.collect { |i| i.producer.to_ruby }
    code.flatten 1
  end

  def footer_code
    "end\n"
  end
end
