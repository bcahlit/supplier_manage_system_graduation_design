class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :phone, :unique => true, :null => false
      #Ex:- :null => false
      t.string :name
      t.integer :type
      t.string :address
      t.integer :level, :default => 0
      #Ex:- :default =>''
      t.string :email
      t.integer :state, :default => 0
      #Ex:- :default =>''
      t.string :concat
      # 联系人姓名
      t.string :zip
      t.string :address
      t.string :bank_number
      t.integer :reputation, :default => 100
      #Ex:- :default =>''
      t.string :fax
      t.string :remark
      t.integer :timely, :default => 100
      #Ex:- :default =>'' 交货及时程度
      t.integer :aftersales, :default => 100
      #Ex:- :default =>''
      t.integer :componiship, :default => 100
      #Ex:- :default =>''合作兼容性

      t.timestamps
    end
  end
end
