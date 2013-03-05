class Spot < ActiveRecord::Base
  attr_accessible :address, :capacity, :city, :description, :name, :zip
  belongs_to :user
  has_many :painting_at_spots
end
