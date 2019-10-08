class DropSchedulerTables < ActiveRecord::Migration[5.0]
  def change
    drop_table :cal_events
  end
end
