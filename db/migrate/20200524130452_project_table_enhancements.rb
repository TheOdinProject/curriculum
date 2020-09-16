class ProjectTableEnhancements < ActiveRecord::Migration[6.0]
  def change
    rename_column :projects, :live_preview, :live_preview_url
    add_column :projects, :is_public, :boolean, default: true, null: false
    add_index :projects, :is_public
  end
end
