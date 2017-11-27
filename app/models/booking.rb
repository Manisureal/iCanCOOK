class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  # validates :booking_date, :start_time, :end_time, presence: [true]
end
