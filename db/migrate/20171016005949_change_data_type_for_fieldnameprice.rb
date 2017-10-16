class ChangeDataTypeForFieldnameprice < ActiveRecord::Migration[5.1]
  def self.up
    change_table :coin_sells do |t|
      t.change :price, :decimal
    end
    change_table :coin_buys do |t|
      t.change :price, :decimal
    end
  end
  def self.down
    change_table :coin_sells do |t|
      t.change :price, :integer
    end
    change_table :coin_buys do |t|
      t.change :price, :integer
    end
  end
end
