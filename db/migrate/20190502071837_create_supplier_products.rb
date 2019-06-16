class CreateSupplierProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :supplier_products do |t|
      t.references :supplier, foreign_key: true, on_delete: :cascade
      t.references :product, foreign_key: true, on_delete: :cascade
      t.string :commit
      t.integer :price, :limit => 8, :limit => 8
      t.integer :back_rate, :default => 0, :limit => 8
      #Ex:- :default =>''
      t.integer :standard, :default => 100, :limit => 8
      #Ex:- :default =>''

      t.timestamps
    end
  end
end
