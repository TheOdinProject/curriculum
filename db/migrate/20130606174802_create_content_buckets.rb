class CreateContentBuckets < ActiveRecord::Migration
  def change
    create_table :content_buckets do |t|
      t.string :name, :null => false
      t.timestamps
    end

    add_index :content_buckets, :name, :unique => true
  end
end
