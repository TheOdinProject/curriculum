class AddReports < ActiveRecord::Migration[6.0]
  def self.up
    create_table :reports do |t|
      t.integer :reporter_id, null: false
      t.references :project, index: true, foreign_key: true, null: false
      t.text :reason, null: false, default: ''
      t.integer :status, null: false, default: 0
      t.integer :action_taken, null: false, default: 0
      t.timestamps
    end

    add_foreign_key :reports, :users, column: :reporter_id
    add_index(:reports, :reporter_id)
  end
end
