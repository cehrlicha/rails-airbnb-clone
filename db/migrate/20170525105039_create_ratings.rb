class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :buyer_rating
      t.integer :seller_rating
      t.text :buyer_review
      t.text :seller_review
      t.references :sale, foreign_key: true

      t.timestamps
    end
  end
end
