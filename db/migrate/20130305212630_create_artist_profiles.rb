class CreateArtistProfiles < ActiveRecord::Migration
  def change
    create_table :artist_profiles do |t|
      t.text :vita
      t.integer :user_id

      t.timestamps
    end
  end
end
