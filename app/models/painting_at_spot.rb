class PaintingAtSpot < ActiveRecord::Base
  attr_accessible :from_date, :to_date
  belongs_to :painting
  belongs_to :spot
  has_and_belongs_to_many :scanned_by, :class_name=>'User', :join_table => "scans"
end
