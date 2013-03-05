class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :name
      t.text :description
      t.integer :capacity
      t.string :address
      t.integer :zip
      t.string :city
      t.integer :user_id

      t.timestamps
    end
  end
end
