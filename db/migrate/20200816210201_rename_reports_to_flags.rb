class RenameReportsToFlags < ActiveRecord::Migration[6.0]
  def change
    rename_table :reports, :flags
    rename_column :flags, :reporter_id, :flagger_id
  end
end
