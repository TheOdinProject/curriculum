require 'rails_helper'

RSpec.describe 'Deleting a Project Submission on the Dashboard', type: :system do
  let(:user) { create(:user) }
  let(:lesson) { create(:lesson, is_project: true, accepts_submission: true, has_live_preview: true) }

  before do
    create(:project_submission, user: user, lesson: lesson)
    sign_in(user)
    visit dashboard_path
  end

  it 'successfully deletes a submission' do
    within(:test_id, 'submissions-list') do
      expect(page).to have_content(lesson.title)
    end

    find(:test_id, 'edit-submission-btn').click
    Pages::ProjectSubmissions::Form.new.delete

    within(:test_id, 'submissions-list') do
      expect(page).not_to have_content(lesson.title)
    end
  end
end
