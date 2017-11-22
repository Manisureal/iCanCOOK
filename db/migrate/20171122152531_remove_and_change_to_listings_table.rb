class RemoveAndChangeToListingsTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :listings, :end_date
    remove_column :listings, :start_date
    add_column :listings, :dates, :text, array: true, default: []
  end
end
