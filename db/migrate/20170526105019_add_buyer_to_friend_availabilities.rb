class AddBuyerToFriendAvailabilities < ActiveRecord::Migration[5.0]
  def change
    add_column :friend_availabilities, :buyer_id, :integer
  end
end
