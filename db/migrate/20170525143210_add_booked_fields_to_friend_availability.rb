class AddBookedFieldsToFriendAvailability < ActiveRecord::Migration[5.0]
  def change
    add_column :friend_availabilities, :booked, :boolean
    add_column :friend_availabilities, :pending, :boolean
  end
end
