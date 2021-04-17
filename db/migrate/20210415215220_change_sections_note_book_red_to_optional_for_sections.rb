class ChangeSectionsNoteBookRedToOptionalForSections < ActiveRecord::Migration[6.1]
  def change
    remove_reference :note_books, :user, null: false, foreign_key: true
    add_reference :note_books, :user, foreign_key: true
  end
end
