class RenameAboutToLearningGoal < ActiveRecord::Migration[5.0][5.0]
  def change
    rename_column :users, :about, :learning_goal
  end
end
