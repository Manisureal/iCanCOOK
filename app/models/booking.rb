class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  monetize :total_amount_pennies
  # validates :booking_date, :start_time, :end_time, presence: [true]
end
