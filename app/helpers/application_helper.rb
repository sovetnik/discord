# frozen_string_literal: true
module ApplicationHelper
  def highlighter(code)
    formatter = Rouge::Formatters::HTML.new
    lexer = Rouge::Lexers::Ruby.new
    formatter.format(lexer.lex(code))
  end
end
