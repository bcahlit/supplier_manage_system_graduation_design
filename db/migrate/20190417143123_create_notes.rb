class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :context
      t.references :user, on_delete: :cascade

      t.timestamps
    end
  end
end
