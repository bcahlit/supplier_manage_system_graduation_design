class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.string :item_name
      t.integer :value
      t.references :user, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :time

      t.timestamps
    end
  end
end
