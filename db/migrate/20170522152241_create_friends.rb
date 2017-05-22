class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.string :name
      t.integer :age
      t.string :phone_number
      t.string :gender
      t.string :city
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
