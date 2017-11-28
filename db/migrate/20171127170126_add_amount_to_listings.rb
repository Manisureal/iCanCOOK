class AddAmountToListings < ActiveRecord::Migration[5.1]
  def change
    add_monetize :listings, :price_amount, currency: { present: false }
  end
end
