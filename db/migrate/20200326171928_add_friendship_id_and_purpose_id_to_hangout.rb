class AddFriendshipIdAndPurposeIdToHangout < ActiveRecord::Migration[6.0]
  def change
    add_column :hangouts, :friendship_id, :integer
    add_column :hangouts, :purpose_id, :integer
  end
end
