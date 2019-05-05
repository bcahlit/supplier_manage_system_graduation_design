class CreateSupplierProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :supplier_products do |t|
      t.references :supplier, foreign_key: true
      t.references :product, foreign_key: true
      t.string :commit
      t.integer :price
      t.integer :back_rate, :default => 0
      #Ex:- :default =>''
      t.integer :standard, :default => 100
      #Ex:- :default =>''

      t.timestamps
    end
  end
end
