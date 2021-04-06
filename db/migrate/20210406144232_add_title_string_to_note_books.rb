class AddTitleStringToNoteBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :note_books, :title, :string
    add_index :note_books, :title, unique: true
  end
end
