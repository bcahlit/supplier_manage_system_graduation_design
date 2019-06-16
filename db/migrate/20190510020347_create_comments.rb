class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :supplier_product, foreign_key: true
      t.references :order_form, foreign_key: true
      t.string :detail
      t.integer :satisfaction, :limit => 8
      t.integer :before_sale, :limit => 8

      t.timestamps
    end
  end
end
