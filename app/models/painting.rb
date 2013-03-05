class Painting < ActiveRecord::Base
  attr_accessible :description, :name
  belongs_to :artist_profile
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :liked_by, :class_name=>'User', :join_table => "painting_likes"
  has_many :painting_at_spots
end
