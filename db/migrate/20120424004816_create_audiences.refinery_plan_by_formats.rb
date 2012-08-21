# This migration comes from refinery_plan_by_formats (originally 2)
class CreateAudiences < ActiveRecord::Migration
  def change
    create_table :audiences do |t|
      t.references :demog
      t.integer :region_code
      t.references :format
      t.integer :weight
      t.float :reach
      t.integer :contacts
      t.integer :region_pop
      t.decimal :avg_freq
      t.integer :duration
      t.references :market
      t.integer :reach_persons

      t.timestamps
    end
    add_index :audiences, :market_id
    add_index :audiences, :region_code
    add_index :audiences, :format_id
    add_index :audiences, :weight
    add_index :audiences, :demog_id
    add_index :audiences, :duration
  end
end
