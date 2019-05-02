class CreateOrderForms < ActiveRecord::Migration[5.2]
  def change
    create_table :order_forms do |t|
      t.references :supplier
      t.references :product      
      t.references :operator, foreign_key: { to_table: :users }
      t.references :reviewer, foreign_key: { to_table: :users }
      # Example: t.column "first_name", :string
      t.integer :time, :null => false
      t.integer :number, :null => false
      #Ex:- :null => false 数量
      t.string :remark
      t.integer :priority, :null => false, :default => 0
      t.integer :state, :default => 0
      #Ex:- :default =>''状态 0：申请 1：批准 2 拒绝 3 已经生成合同
      
      #Ex:- :null => false

      t.timestamps
    end
  end
end
