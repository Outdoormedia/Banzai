class CreatePlanByFormatsPlanByFormats < ActiveRecord::Migration

  def up
    create_table :refinery_plan_by_formats do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-plan_by_formats"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/plan_by_formats/plan_by_formats"})
    end

    drop_table :refinery_plan_by_formats

  end

end
