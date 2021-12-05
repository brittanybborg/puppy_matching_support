require 'open-uri'
class UserProfile < ApplicationRecord
  before_validation :geocode_home_location

  def geocode_home_location
    if self.home_location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(self.home_location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.home_location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.home_location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.home_location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  enum home_activity_level: {"low"=>0, "medium"=>1, "high"=>2} 

  # Direct associations

  has_many   :buyer_favorites,
             :foreign_key => "user_id",
             :dependent => :destroy

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
