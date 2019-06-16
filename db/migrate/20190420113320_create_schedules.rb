class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :date, :null => false, :limit => 8
      #Ex:- :null => false
      t.string :detail
      t.string :link
      t.integer :degree, :default => 0, :limit => 8
      #Ex:- :default =>''
      t.references :user, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
