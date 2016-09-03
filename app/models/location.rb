class Location < ApplicationRecord
  validates_presence_of :address
  geocoded_by :address
  after_validation :geocode, if: ->(obj) { obj.address.present? and obj.address_changed? }

  def coordinates
    [latitude, longitude]
  end
end