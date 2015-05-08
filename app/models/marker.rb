class Marker < ActiveRecord::Base
  attr_accessible :address, :description, :latitude, :longitude, :title
  geocoded_by :address
  after_validation :geocode
  belongs_to :my_map
  validates :title, presence:true, uniqueness: true
  validates :latitude, presence:true
end
