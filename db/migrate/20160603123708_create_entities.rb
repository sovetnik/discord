class CreateEntities < ActiveRecord::Migration
  enable_extension 'hstore' unless extension_enabled?('hstore')
  def change
    create_table :entities do |t|
      t.integer :parent_id
      t.integer :sort_order
      t.string :kind
      t.string :name
      t.text :desc
      t.hstore :deps

      t.timestamps null: false
    end
  end
end
