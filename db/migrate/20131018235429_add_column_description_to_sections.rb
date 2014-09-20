class AddColumnDescriptionToSections < ActiveRecord::Migration
  def change
    add_column :sections, :description, :text
  end
end
