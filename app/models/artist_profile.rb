class ArtistProfile < ActiveRecord::Base
  attr_accessible :vita
  belongs_to :user
  has_many :paintings
end
