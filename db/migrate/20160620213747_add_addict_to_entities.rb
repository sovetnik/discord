# frozen_string_literal: true
class AddAddictToEntities < ActiveRecord::Migration
  def change
    add_column :entities, :addict, :json, default: {}, null: false
  end
end
