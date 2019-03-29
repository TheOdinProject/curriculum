class AddLearnAndBuildColumnsToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :you_learn, :string
    add_column :courses, :you_build, :string
  end
end
