class AddAcceptsSubmissionToLessons < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :accepts_submission, :boolean, default: false, null: false
  end
end
