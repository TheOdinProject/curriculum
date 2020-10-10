class CreatePointsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :points do |t|
      t.string :discord_id, null: false, index: { unique: true }
      t.integer :points, null: false, default: 0

      t.timestamps
    end
  end
end
