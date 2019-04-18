class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :context
      t.user :references

      t.timestamps
    end
  end
end
