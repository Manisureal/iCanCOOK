class RemoveAvatarFromUsersAndAddPhotos < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :avatar
    add_column :users, :photo, :string
  end
end
