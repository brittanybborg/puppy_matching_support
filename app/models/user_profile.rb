class UserProfile < ApplicationRecord
  enum home_activity_level: {"low"=>0, "medium"=>1, "high"=>2} 

  # Direct associations

  has_many   :buyer_reviews,
             :class_name => "BreederReview",
             :foreign_key => "buyer_id"

  # Indirect associations

  # Validations

  validates :breeder_true, :presence => true

  validates :cat_present, :presence => true

  validates :children_present, :presence => true

  validates :home_activity_level, :presence => true

  validates :home_location, :uniqueness => true

  validates :home_location, :presence => true

  validates :username, :uniqueness => true

  validates :username, :presence => true

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
