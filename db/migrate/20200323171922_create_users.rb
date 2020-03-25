class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :amount_of_corn
      t.integer :amount_of_money
      t.string :password
      t.boolean :bot
      t.timestamps
    end
  end
end
