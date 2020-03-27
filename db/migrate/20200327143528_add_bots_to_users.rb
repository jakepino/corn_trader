class AddBotsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :bots, :boolean
  end
end
