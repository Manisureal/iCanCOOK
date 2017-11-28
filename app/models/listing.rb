class Listing < ApplicationRecord

  belongs_to :user
  has_many :bookings

  monetize :price_amount_pennies
  # mount_uploader :photos, PhotoUploader

  EVENTS = ["Canapes Parties", "BBQ", "Birthday Parties", "Dinner Parties", "Garden Parties", "Family Cooks"]
end
