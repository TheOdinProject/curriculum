class AddResolvedByIdToFlags < ActiveRecord::Migration[6.1]
  def change
    add_column :flags, :resolved_by_id, :integer, default: 0, null: false
  end
end
