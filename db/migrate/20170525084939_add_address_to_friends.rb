class AddAddressToFriends < ActiveRecord::Migration[5.0]
  def change
    add_column :friends, :address, :string
  end
end
