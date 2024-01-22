class AddPhotoToFriends < ActiveRecord::Migration[6.1]
  def change
    add_column :friends, :photo, :string
  end
end
