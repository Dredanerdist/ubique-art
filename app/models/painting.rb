class Painting < ActiveRecord::Base
  attr_accessible :description, :name, :image
  belongs_to :artist_profile

  has_and_belongs_to_many :tags
  has_and_belongs_to_many :liked_by, :class_name=>'User', :join_table => "painting_likes"

  has_many :spots,
    class_name: PaintingAtSpot.name.to_s

   mount_uploader :image, PaintingUploader
end
