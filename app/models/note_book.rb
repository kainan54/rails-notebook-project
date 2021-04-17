class NoteBook < ApplicationRecord
    belongs_to :user, optional: false
    has_many :sections, dependent: :destroy
    
    accepts_nested_attributes_for :sections,
    allow_destroy: true, 
    reject_if: lambda { |props| props['title'].blank? }

    has_many :saved_note_book_joins
    has_many :suscribed, through: :saved_note_book_joins, source: :user

    def self.filter_by_title(query)
        self.where("lower(title) like ?", "%#{query.downcase}%").limit(50).order(updated_at: :DESC)
    end
end
