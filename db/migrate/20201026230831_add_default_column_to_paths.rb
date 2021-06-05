class AddDefaultColumnToPaths < ActiveRecord::Migration[6.0]
  def change
    remove_column :paths, :default
    add_column :paths, :default_path, :boolean, default: false, null: false

    Path.find_by!(title: 'Foundations').update(default_path: true)
  end
end
