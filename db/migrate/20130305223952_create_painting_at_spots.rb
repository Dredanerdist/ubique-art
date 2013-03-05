class CreatePaintingAtSpots < ActiveRecord::Migration
  def change
    create_table :painting_at_spots do |t|
      t.date :from_date
      t.date :to_date
      t.integer :spot_id
      t.integer :painting_id

      t.timestamps
    end
  end
end
