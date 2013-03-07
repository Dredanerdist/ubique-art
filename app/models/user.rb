class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  has_one :artist_profile
  has_and_belongs_to_many :liked_paintings, :class_name=>'Painting', :join_table => "painting_likes"

  has_many :spots

  has_and_belongs_to_many :scans, :class_name=>'PaintingAtSpot', :join_table => "scans"

  def admin?
    return has_role?(:admin)
  end
end
