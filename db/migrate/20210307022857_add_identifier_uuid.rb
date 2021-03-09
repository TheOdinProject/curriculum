class AddIdentifierUuid < ActiveRecord::Migration[6.1]
  def up
    add_column :paths, :identifier_uuid, :string, null: false, default: ''
    add_column :courses, :identifier_uuid, :string, null: false, default: ''
    add_column :sections, :identifier_uuid, :string, null: false, default: ''
    add_column :lessons, :identifier_uuid, :string, null: false, default: ''
  end

  def down
    remove_column :paths, :identifier_uuid
    remove_column :courses, :identifier_uuid
    remove_column :sections, :identifier_uuid
    remove_column :lessons, :identifier_uuid
  end
end
