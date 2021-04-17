class SavedNoteBookJoin < ApplicationRecord
    belongs_to :user
    belongs_to :note_book

    validates_uniqueness_of :user_id, :scope => :note_book_id
end
