# This migration comes from refinery_plan_by_formats (originally 3)
class CreatePlanningWeights < ActiveRecord::Migration
  def change
    create_table :planning_weights do |t|
      t.references :market
      t.references :format
      t.integer :heavy
      t.integer :medium
      t.integer :light

      t.timestamps
    end
    add_index :planning_weights, :market_id
    add_index :planning_weights, :format_id
  end
end
