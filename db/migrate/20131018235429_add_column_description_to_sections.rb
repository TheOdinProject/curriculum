class AddColumnDescriptionToSections < ActiveRecord::Migration[5.0]
  def change
    add_column :sections, :description, :text
  end
end
