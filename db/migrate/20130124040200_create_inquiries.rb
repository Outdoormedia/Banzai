class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.string :name
      t.string :title
      t.string :phone
      t.string :email
      t.string :address
      t.string :interest

      t.timestamps
    end
  end
end
