class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, :null => false
      #Ex:- :null => false
      t.integer :total, :null => false
      t.string :number, :null => false
      t.string :introduction
      t.string :type
      t.integer :time, :null => false
      t.string :remake
      t.integer :price, :null => false
      t.string :color
      t.string :size, :null => false
      t.string :band
      t.integer :classify

      t.timestamps
    end
  end
end