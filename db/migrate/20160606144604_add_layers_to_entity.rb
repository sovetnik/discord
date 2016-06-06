class AddLayersToEntity < ActiveRecord::Migration
  def change
    add_column :entities, :layer_id, :integer
  end
end
