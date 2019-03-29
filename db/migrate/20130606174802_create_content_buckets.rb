class CreateContentBuckets < ActiveRecord::Migration[5.0]
  def change
    create_table :content_buckets do |t|
      t.string :name, :null => false
      t.timestamps
    end

    add_index :content_buckets, :name, :unique => true
  end
end
