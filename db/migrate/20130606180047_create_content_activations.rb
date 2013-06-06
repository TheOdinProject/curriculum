class CreateContentActivations < ActiveRecord::Migration
  def change
    create_table :content_activations do |t|
      t.integer :user_id, :null => false
      t.integer :content_bucket_id, :null => false

      t.timestamps
    end

    add_index :content_activations, [:user_id, :content_bucket_id], :unique => true

  end
end
