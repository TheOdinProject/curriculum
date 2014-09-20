class CreateAdminFlashes < ActiveRecord::Migration
  def change
    create_table :admin_flashes do |t|

      t.timestamps
    end
  end
end
