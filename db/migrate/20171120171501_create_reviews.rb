class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :listing, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
