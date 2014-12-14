class CreateCalEvents < ActiveRecord::Migration
  def change
    create_table :cal_events do |t|
      t.string :summary
      t.datetime :start
      t.datetime :end
      t.text :description
      t.string :time_zone
      t.integer :creator_id

      t.timestamps
    end

    add_index :cal_events, :creator_id
    add_index :cal_events, :start
    add_index :cal_events, :end
    
  end
end
