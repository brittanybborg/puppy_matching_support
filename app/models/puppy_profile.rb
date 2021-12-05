class PuppyProfile < ApplicationRecord
  enum activity_level: {"low"=>0, "medium"=>1, "high"=>2} 

  # Direct associations

  belongs_to :litter,
             :counter_cache => :dog_profiles_count

  has_many   :buyer_favorites,
             :foreign_key => "puppy_id",
             :dependent => :destroy

  # Indirect associations

  has_one    :bitch,
             :through => :litter,
             :source => :bitch

  # Validations

  validates :name, :uniqueness => true

  validates :name, :presence => true

  # Scopes

  def to_s
    name
  end

end
