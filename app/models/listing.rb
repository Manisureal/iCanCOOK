class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings

  EVENTS = ["Canapes Parties", "BBQ", "Birthday Parties", "Dinner Parties"]
end
