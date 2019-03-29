class SuccessStories < ActiveRecord::Migration[5.0][5.0]
  def change
    create_table(:success_stories) do |table|
      table.string :student_name
      table.string :avatar_path_name
      table.text :story_content
      table.string :job_title
      table.string :social_media_link

      table.timestamps
    end
  end
end
