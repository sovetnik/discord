class Entity < ActiveRecord::Base
  acts_as_tree order: 'sort_order'

  scope :layers, -> { where(kind: 'Layer') }

  # #const
  KINDS = %w(Aught Domain Layer Model Context).freeze

  ## interface
  def to_hash
    { text: name,
      href: "##{name.downcase}",
      tags: [kind],
      nodes: nodes }
  end

  def nodes
    nodes_arr = []
    children.each do |child|
      nodes_arr << child.to_hash
    end
    nodes_arr
  end

  def sentence
    [producer.sentence, layer_sentence].join ' '
  end

  def layer_sentence
    "in #{layer.name}" if layer
  end

  def layer
    Entity.layers.find(layer_id) if layer_id
  end

  ## define layer
  def producer
    Producer.new self
  end

  def add_child(params)
    child = children.create(params)
  end

  ## Possible values to collection select & validation
  def parents_list
    Entity.all
  end

  def kinds_list
    KINDS.map.with_index { |obj, index| [index, obj] }
  end

  def layers_list
    list = []
    list << parent.siblings.layers unless root?
    list << siblings.layers unless root?
    list << children.layers
    list.flatten
  end

  def deps_list
    Entity.all
  end

  ## kind num getter
  def kind_num
    KINDS.rindex kind
  end

  ## kind setter by num
  def kind_num=(num)
    self.kind = KINDS[num.to_i] || ''
  end
end
