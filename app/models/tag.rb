class Tag < ActiveRecord::Base
  attr_accessible :name
  belongs_to :tag_category
  has_and_belongs_to_many :paintings
end
