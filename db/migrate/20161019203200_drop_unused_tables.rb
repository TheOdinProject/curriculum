class DropUnusedTables < ActiveRecord::Migration[5.0]
  def change
    drop_table :content_activations
    drop_table :content_buckets
    drop_table :user_prefs
  end
end
