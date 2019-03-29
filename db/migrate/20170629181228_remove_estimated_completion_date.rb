class RemoveEstimatedCompletionDate < ActiveRecord::Migration[5.0][5.0]
  def change
    remove_column :users, :learning_goal_completion_date, :date
  end
end
