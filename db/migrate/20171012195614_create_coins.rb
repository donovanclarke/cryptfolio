class CreateCoins < ActiveRecord::Migration[5.1]
  def change
    create_table :coins do |t|
      t.string :email
      t.string :coinID
      t.string :name
      t.integer :amount
      t.boolean :active

      t.timestamps
    end
  end
end
