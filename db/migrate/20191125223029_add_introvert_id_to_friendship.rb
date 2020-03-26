class AddIntrovertIdToFriendship < ActiveRecord::Migration[6.0]
  def change
    add_column :friendships, :introvert_id, :bigint
  end
end