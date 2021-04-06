class Section < ApplicationRecord
    belongs_to :note_book
    has_rich_text :content
end
