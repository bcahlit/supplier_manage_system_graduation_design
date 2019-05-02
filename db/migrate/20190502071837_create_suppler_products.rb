class CreateSupplerProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :suppler_products do |t|
      t.references :supplier, foreign_key: true
      t.references :product, foreign_key: true
      t.string :commit
      t.integer :price
      t.integer :back_rate
      t.integer :standard

      t.timestamps
    end
  end
end
