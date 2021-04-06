class AddReferenceForNoteBookToSections < ActiveRecord::Migration[6.1]
  def change
    add_reference :sections, :note_book, null: false, foreign_key: true
  end
end
