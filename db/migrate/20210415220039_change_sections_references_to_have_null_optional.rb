class ChangeSectionsReferencesToHaveNullOptional < ActiveRecord::Migration[6.1]
  def change
    remove_reference :sections, :note_book, null: false, foreign_key: true
    add_reference :sections, :note_book, null: true, foreign_key: true
  end
end
