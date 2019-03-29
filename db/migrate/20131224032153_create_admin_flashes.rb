class CreateAdminFlashes < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_flashes do |t|

      t.timestamps
    end
  end
end
