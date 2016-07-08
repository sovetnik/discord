# frozen_string_literal: true
class RemoveAddicts < ActiveRecord::Migration
  def change
    remove_column :entities, :addict
  end
end
