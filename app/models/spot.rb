class Spot < ActiveRecord::Base
  attr_accessible :address, :capacity, :city, :description, :name, :zip
  belongs_to :user
  has_many :painting_at_spots
  
  validates :user_id, presence: true
  
  acts_as_gmappable

  def gmaps4rails_address
    "#{self.address}, #{self.city}" 
  end
  def gmaps4rails_infowindow
    # TODO move to a view
    "<h4>#{ERB::Util.html_escape name}</h1> #{ERB::Util.html_escape description}"
  end
end
