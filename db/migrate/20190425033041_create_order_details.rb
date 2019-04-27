class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.references :order_form, foreign_key: true
      t.references :product, foreign_key: true
      # 数量
      t.integer :number, :null => false, :default => 1
      #Ex:- :default =>''
      t.string :type
      t.integer :time
      t.string :remake
      t.integer :price, :null => false
      t.integer :origin_price, :null => false

      t.timestamps
    end
  end
end
