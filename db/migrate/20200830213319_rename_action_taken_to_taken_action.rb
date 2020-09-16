class RenameActionTakenToTakenAction < ActiveRecord::Migration[6.0]
  def change
    rename_column :flags, :action_taken, :taken_action
  end
end
