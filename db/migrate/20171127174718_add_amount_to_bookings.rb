class AddAmountToBookings < ActiveRecord::Migration[5.1]
  def change
    add_monetize :bookings, :total_amount, currency: { present: false }
  end
end
