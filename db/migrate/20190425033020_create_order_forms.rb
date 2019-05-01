class CreateOrderForms < ActiveRecord::Migration[5.2]
  def change
    create_table :order_forms do |t|
      t.references :supplier, foreign_key: true, on_delete: :cascade
      t.integer :time, :null => false
      #Ex:- :null => false
      t.string :remark
      t.integer :total_price, :null => false
      t.integer :score, :null => false
      t.integer :state, :default => 0
      #Ex:- :default =>''
      
      #Ex:- :null => false

      t.timestamps
    end
  end
end
