class Treasure < ActiveRecord::Base
  include NumericHelper

  reverse_geocoded_by :latitude, :longtitude
  validates :longtitude, presence: true, if: :longtitude
  validates :latitude, presence: true, if: :latitude

  before_save :convert_compass_coordinates

  attr_accessor :long, :lat

  def convert_compass_coordinates

    self.latitude   = convert_coordinates(self.lat)
    self.longtitude = convert_coordinates(self.long)
  end

end
