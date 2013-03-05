class CreateUsersPaintingAtSpotsJoinTable < ActiveRecord::Migration
  def change
    create_table :scans, :id => false do |t|
      t.integer :user_id
      t.integer :painting_at_spot_id
    end
  end
end
