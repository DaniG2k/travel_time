class Route < ApplicationRecord
  validates_presence_of :start, :end
end
