class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true
      t.integer :time, :null => false
      #Ex:- :null => false
      t.string :remark
      t.integer :total_price, :null => false
      t.integer :score, :null => false
      #Ex:- :null => false

      t.timestamps
    end
  end
end
