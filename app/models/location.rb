class Location < ApplicationRecord
  validates_presence_of :address

  after_validation :geocode, if: ->(obj) { obj.address.present? and obj.address_changed? }
  geocoded_by :address
  after_validation :geocode
end