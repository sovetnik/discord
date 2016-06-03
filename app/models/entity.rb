class Entity < ActiveRecord::Base
  acts_as_tree

  # #const
  KINDS = %w(Domain Model Context).freeze

  ## Possible values to collection select & validation
  def parents_list
    Entity.all
  end

  def kinds_list
    KINDS.map.with_index { |obj, index| [index, obj] }
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
