class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, :null => false
      #Ex:- :null => false
      t.string :number, :null => false
      t.string :type
      t.string :remark
      # 备注
      t.string :color
      t.string :classify
      # 0 食品 1 服饰 2 办公设备 3 机械设备 4 建筑设备 5 水果 6 系统维护服务

      t.timestamps
    end
  end
end
