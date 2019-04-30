class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.string :item_name, :null => false
      #Ex:- :null => false
      t.integer :value, :null => false
      #Ex:- :null => false
      t.references :customer, foreign_key: true, on_delete: :cascade
      t.references :order_form, foreign_key: true, on_delete: :cascade
      t.integer :time

      t.timestamps
    end
  end
end
