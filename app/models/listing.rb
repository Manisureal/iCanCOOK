class Listing < ApplicationRecord

  belongs_to :user
  has_many :bookings

  # mount_uploader :photos, PhotoUploader

  EVENTS = ["Canapes Parties", "BBQ", "Birthday Parties", "Dinner Parties", "Garden Parties", "Family Cooks"]
end
