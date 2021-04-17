class AddSectionRefToSections < ActiveRecord::Migration[6.1]
  def change
    add_reference :sections, :section, foreign_key: true
  end
end
