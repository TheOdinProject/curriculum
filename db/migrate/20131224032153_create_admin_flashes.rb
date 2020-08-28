class CreateAdminFlashes < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_flashes, &:timestamps
  end
end
