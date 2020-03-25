class CreateTrades < ActiveRecord::Migration[6.0]
    def change
      create_table :trades do |t|
        t.integer :buyer_id
        t.integer :seller_id
        t.integer :corn_quantity
        t.integer :price
  
        t.timestamps
      end
    end
  end