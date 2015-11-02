class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.integer :position, :null => false
      t.integer :course_id, :null => false

      t.timestamps
    end
    add_index :sections, :title, :unique => true
    add_index :sections, :position
    add_index :sections, :course_id
  end
end
