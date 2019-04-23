class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :phone, :unique => true, :null => false
      #Ex:- :null => false
      t.string :name
      t.string :address
      t.string :sex
      t.integer :origin
      t.integer :level, :default => 0
      #Ex:- :default =>''
      t.string :wechart
      t.string :qq
      t.string :email
      t.integer :state, :default => 0
      #Ex:- :default =>''
      t.integer :age
      t.boolean :marriage
      t.integer :birthday
      t.string :work

      t.timestamps
    end
  end
end
