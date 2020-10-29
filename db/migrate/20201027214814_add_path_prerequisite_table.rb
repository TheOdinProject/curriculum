class AddPathPrerequisiteTable < ActiveRecord::Migration[6.0]
  def change
    create_table :path_prerequisites do |t|
      t.references :path, index: true, foreign_key: true, null: false
      t.references :prerequisite, index: true, foreign_key: { to_table: :paths }, null: false

      t.timestamps
    end

    add_index :path_prerequisites, %i[path_id prerequisite_id], unique: true
  end
end
