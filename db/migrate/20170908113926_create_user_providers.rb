class CreateUserProviders < ActiveRecord::Migration[5.0][5.0]
  def change
    create_table :user_providers do |t|
      t.references :user, index: true
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
