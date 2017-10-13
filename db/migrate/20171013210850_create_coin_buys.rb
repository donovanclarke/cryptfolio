class CreateCoinBuys < ActiveRecord::Migration[5.1]
  def change
    create_table :coin_buys do |t|
      t.string :email
      t.string :coinID
      t.integer :amount
      t.integer :price

      t.timestamps
    end
  end
end
