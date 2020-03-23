class CreateBids < ActiveRecord::Migration[6.0]
  def change
    create_table :bids do |t|
      t.integer :user_id
      t.integer :corn_quantity
      t.integer :price

      t.timestamps
    end
  end
end
