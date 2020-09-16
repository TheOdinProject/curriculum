class CreateTracks < ActiveRecord::Migration[5.0]
  def up
    create_table :tracks do |t|
      t.string :title
      t.string :description
      t.integer :position

      t.timestamps
    end
  end

  def down
    drop_table :tracks
  end
end
