class RemoveAd < ActiveRecord::Migration[5.0][5.0]
  def change
    drop_table :ads
  end
end
