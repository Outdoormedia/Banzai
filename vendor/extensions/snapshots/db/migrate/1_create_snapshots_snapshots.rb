class CreateSnapshotsSnapshots < ActiveRecord::Migration

  def up
    create_table :refinery_snapshots do |t|
      t.references :market
      t.references :demog
      t.references :format
      t.integer :number_of_days_1
      t.integer :number_of_days_2
      t.string :reaches_1
      t.string :reaches_2
      t.string :x_labels
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-snapshots"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/snapshots/snapshots"})
    end

    drop_table :refinery_snapshots

  end

end
