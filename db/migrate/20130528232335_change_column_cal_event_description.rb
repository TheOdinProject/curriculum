class ChangeColumnCalEventDescription < ActiveRecord::Migration[5.0]
  def up
    change_column :cal_events, :description, :string
  end

  def down
    change_column :cal_events, :description, :text
  end
end
