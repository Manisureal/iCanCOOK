class RemoveAndAddColumnToListings < ActiveRecord::Migration[5.1]
  def change
    remove_column :listings, :events
    add_column :listings, :events, :string, array: true, default: []
  end
end
