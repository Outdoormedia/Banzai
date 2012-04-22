class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.string :name
      t.integer :parent_id
      t.string :system_code
      t.integer :position_value, :default => Selection::HIDDEN_POSITION
      t.boolean :is_default, :default => false
      t.boolean :is_system, :is_default => false
      t.datetime :archived_at

      t.integer :original_id
      t.timestamps
    end
  end
end
