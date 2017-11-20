class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :listing, foreign_key: true
      t.references :user, foreign_key: true
      t.date :booking_date
      t.integer :total_price
      t.integer :duration
      t.string :status

      t.timestamps
    end
  end
end
