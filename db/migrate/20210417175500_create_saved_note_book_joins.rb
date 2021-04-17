class CreateSavedNoteBookJoins < ActiveRecord::Migration[6.1]
  def change
    create_table :saved_note_book_joins do |t|
      t.integer :user_id
      t.integer :note_book_id

      t.timestamps
    end
  end
end
