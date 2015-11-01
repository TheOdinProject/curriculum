class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :image_path, :null => false
      t.string :url, :null => false
      t.string :style, :null => false
      t.string :client, :null => false
      t.string :category, :null => false
      t.integer :display_count, :null => false, :default => 0

      t.timestamps
    end
  end
end
