class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.references :user, foreign_key: true
      t.string :events
      t.date :start_date
      t.date :end_date
      t.string :photos
      t.text :description
      t.text :experience
      t.integer :sort_code
      t.integer :account_number
      t.integer :price
      t.string :speciality
      t.string :line1
      t.string :line2
      t.string :city
      t.string :postcode
      t.integer :bookings_completed
      t.date :last_booking

      t.timestamps
    end
  end
end
