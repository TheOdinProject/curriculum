class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :url
      t.integer :position, :null => false
      t.text :description
      t.boolean :is_project, :default => false
      t.integer :section_id, :null => false
      t.integer :course_id, :null => false

      t.timestamps
    end
    add_index :lessons, :title, :unique => true
    add_index :lessons, :position, :unique => true
    add_index :lessons, :section_id
    add_index :lessons, :course_id
  end
end
