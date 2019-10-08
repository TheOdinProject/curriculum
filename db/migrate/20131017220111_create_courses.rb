class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
    add_index :courses, :title, :unique => true
  end
end
