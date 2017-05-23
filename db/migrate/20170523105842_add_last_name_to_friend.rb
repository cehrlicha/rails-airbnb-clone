class AddLastNameToFriend < ActiveRecord::Migration[5.0]
  def change
    add_column :friends, :last_name, :string
    rename_column :friends, :name, :first_name
  end
end
