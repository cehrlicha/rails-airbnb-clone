class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.datetime :start_daytime
      t.datetime :end_daytime
      t.string :location
      t.references :friend, foreign_key: true
      t.integer :buyer_id

      t.timestamps
    end

  end
end
