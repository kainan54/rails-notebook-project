class Section < ApplicationRecord
    belongs_to :note_book, optional: true

    belongs_to :parent_section, class_name: :Section, optional: true

    has_many :sections, foreign_key: :parent_section_id, inverse_of: :parent_section, dependent: :destroy

    accepts_nested_attributes_for :sections,
    allow_destroy: true, 
    reject_if: lambda { |props| props['title'].blank? }
    
    has_rich_text :content
    validate :parent_section_or_parent_note_book

    def parent_section_or_parent_note_book
        unless note_book.blank? ^ parent_section.blank?
            errors.add(:no_parent, "Section needs a parent section or Notebook")
        end
    end

    def parent_note_book

        curr = self

        while curr 
            if curr.note_book
                return curr.note_book
            elsif curr.parent_section
                curr = curr.parent_section
                puts curr
            else
                return nil
            end
        end
    end
end
