class Listing < ApplicationRecord

  belongs_to :user
  has_many :bookings

  mount_uploader :photos, PhotoUploader

  monetize :price_amount_pennies

  EVENTS = ["Canapes Parties", "BBQ", "Birthday Parties", "Dinner Parties", "Garden Parties", "Family Cooks"]
end
