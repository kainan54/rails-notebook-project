class AddUserRefToNoteBooks < ActiveRecord::Migration[6.1]
  def change
    add_reference :note_books, :user, null: false, foreign_key: true
  end
end
