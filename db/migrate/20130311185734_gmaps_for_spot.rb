class GmapsForSpot < ActiveRecord::Migration
  def change
    add_column :spots, :latitude,  :float #you can change the name, see wiki
    add_column :spots, :longitude, :float #you can change the name, see wiki
    add_column :spots, :gmaps, :boolean #not mandatory, see wiki
  end
end
