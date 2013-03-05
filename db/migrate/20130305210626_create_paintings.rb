class CreatePaintings < ActiveRecord::Migration
  def change
    create_table :paintings do |t|
      t.string :name
      t.text :description
      t.integer :artist_profile_id

      t.timestamps
    end
  end
end
