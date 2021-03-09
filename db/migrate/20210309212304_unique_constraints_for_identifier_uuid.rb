class UniqueConstraintsForIdentifierUuid < ActiveRecord::Migration[6.1]
  def up
    add_index :paths, :identifier_uuid, unique: true
    add_index :courses, :identifier_uuid, unique: true
    add_index :sections, :identifier_uuid, unique: true
    add_index :lessons, %i[identifier_uuid section_id], unique: true
  end

  def down
    remove_index :paths, :identifier_uuid, unique: true
    remove_index :courses, :identifier_uuid, unique: true
    remove_index :sections, :identifier_uuid, unique: true
    remove_index :lessons, %i[identifier_uuid section_id], unique: true
  end
end
