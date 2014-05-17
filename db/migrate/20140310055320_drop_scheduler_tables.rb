class DropSchedulerTables < ActiveRecord::Migration
  def change
    drop_table :cal_events
  end
end
