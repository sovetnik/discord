# frozen_string_literal: true
class Produce::Layer::Spec
  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def generate_path
    "\"\#\{Rails.root\}/spec/lib/#{dynamic_path}_spec.rb\""
  end

  def generate_spec
    [require_line, head_line, subject_line, abilites_lines, 'end']
  end

  def require_line
    "require \"\#\{Rails.root\}/lib/#{dynamic_path}\"\n"
  end

  def dynamic_path
    repo.producer.reverse_ancestry.map(&:underscore).join('/')
  end

  def head_line
    "describe  #{subject_name} do"
  end

  def subject_line
    if repo.producer.init_args.any?
      "let(:subject) { #{subject_name}.new(#{args_line}) }"
    else
      "let(:subject) { #{subject_name}.new }"
    end
  end

  def args_line
    repo.producer.init_args.collect(&:name).join(', ')
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
