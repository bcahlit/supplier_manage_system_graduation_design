class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :context
      t.references :user

      t.timestamps
    end
  end
end
