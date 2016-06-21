# frozen_string_literal: true
class RemoveDepsFromEntities < ActiveRecord::Migration
  def change
    remove_column :entities, :deps
  end
end
