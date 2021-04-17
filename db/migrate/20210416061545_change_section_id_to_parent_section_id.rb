class ChangeSectionIdToParentSectionId < ActiveRecord::Migration[6.1]
  def change
    remove_reference :sections, :section, foreign_key: true
    add_reference :sections, :parent_section, null: true, foreign_key: { to_table: :sections }
  end
end
