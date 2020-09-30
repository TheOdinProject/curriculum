class AddHasLivePreviewToLessons < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :has_live_preview, :boolean, default: false, null: false
  end
end
