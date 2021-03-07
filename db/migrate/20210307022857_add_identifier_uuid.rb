class AddIdentifierUuid < ActiveRecord::Migration[6.1]
  def up
    add_column :paths, :identifier_uuid, :string, null: false, default: ''
  end

  def down
    remove_column :paths, :identifier_uuid
  end
end
