class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :date, :null => false
      #Ex:- :null => false
      t.string :detail
      t.string :link
      t.integer :degree, :default => 0
      #Ex:- :default =>''
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
