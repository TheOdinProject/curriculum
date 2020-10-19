class AddChoosePathLessonFlagToLessons < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :choose_path_lesson, :boolean, null: false, default: false
  end
end
