class AddLearnAndBuildColumnsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :you_learn, :string
    add_column :courses, :you_build, :string
  end
end
