class NoteBook < ApplicationRecord
    belongs_to :user
    has_many :sections, dependent: :destroy
    accepts_nested_attributes_for :sections, 
    reject_if: lambda { |props| props['title'].blank? }
end
