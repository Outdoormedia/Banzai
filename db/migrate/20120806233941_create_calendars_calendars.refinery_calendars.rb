# This migration comes from refinery_calendars (originally 1)
class CreateCalendarsCalendars < ActiveRecord::Migration

  def up
    create_table :refinery_calendars do |t|
      t.string :title
      t.datetime :when
      t.string :where
      t.string :sponsor
      t.text :description
      t.string :url
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-calendars"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/calendars/calendars"})
    end

    drop_table :refinery_calendars

  end

end
