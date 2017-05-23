class CreateFriendAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :friend_availabilities do |t|
      t.datetime :start_daytime
      t.datetime :end_daytime
      t.references :friend, foreign_key: true

      t.timestamps
    end
  end
end
