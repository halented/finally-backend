class AddUserIdToFriendship < ActiveRecord::Migration[6.0]
  def change
    add_column :friendships, :user_id, :bigint
  end
end
