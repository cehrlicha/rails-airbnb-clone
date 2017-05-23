class AddInfoToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string
    add_column :users, :image, :string
    add_column :users, :cover_picture, :string
    add_column :users, :phone_number, :string
  end
end
