class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :phone, :unique => true, :null => false
      #Ex:- :null => false
      t.string :name
      t.string :address
      t.string :wechart
      t.integer :origin, :default => 0
      t.integer :age
      t.string :sex
      t.integer :level, :default => 0
      #Ex:- :default =>''
      t.string :qq
      t.string :email
      t.integer :state, :default => 0
      #Ex:- :default =>''
      t.boolean :marriage
      t.integer :birthday
      t.string :work

      t.timestamps
    end
  end
end
