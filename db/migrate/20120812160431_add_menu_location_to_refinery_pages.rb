class AddMenuLocationToRefineryPages < ActiveRecord::Migration
  def change
    add_column :refinery_pages, :menu_location, :string
  end
end
