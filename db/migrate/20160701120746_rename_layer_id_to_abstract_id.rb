class RenameLayerIdToAbstractId < ActiveRecord::Migration
  def change
    rename_column :entities, :layer_id, :abstract_id
  end
end
