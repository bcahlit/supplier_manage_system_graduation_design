class CreateOrderForms < ActiveRecord::Migration[5.2]
  def change
    create_table :order_forms do |t|
      t.references :supplier
      t.references :product
      t.references :user, foreign_key: true
      # 采购计划申请人
      t.references :reviewer, foreign_key: { to_table: :users }
      # Example: t.column "first_name", :string
      t.integer :time, :null => false
      t.integer :number, :null => false
      t.integer :total_price
      #Ex:- :null => false 数量
      t.string :remark
      t.integer :priority, :null => false, :default => 0
      t.integer :state, :default => 0
      #Ex:- :default =>''状态 0：申请 1：拒绝 2批准  3 已经生成订单 4 已到货 5:已评价 6 订单完成 7 已退货

      t.timestamps
    end
  end
end
