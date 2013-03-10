class AddGmapsToSpot < ActiveRecord::Migration
  def change
    add_column :spots, :longitude, :float
    add_column :spots, :latitude, :float
    add_column :spots, :gmaps, :boolean
  end
end
