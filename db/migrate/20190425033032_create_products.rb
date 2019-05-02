class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, :null => false
      #Ex:- :null => false
      t.string :number, :null => false
      t.string :type
      # 备注
      t.string :remark
      t.string :color
      t.string :size, :null => false
      t.integer :classify

      t.timestamps
    end
  end
end
