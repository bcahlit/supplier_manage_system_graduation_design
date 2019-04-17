class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name, :null => false,:unique => true
      #Ex:- :null => false
      t.string :qq
      t.string :wechat
      t.string :real_name
      t.string :password_digest
      t.string :title
      t.string :phone, :null => false
      #Ex:- :null => false
      t.integer :level, :default => 0
      #Ex:- :default =>''
      t.string :sex

      t.timestamps
    end
  end
end
