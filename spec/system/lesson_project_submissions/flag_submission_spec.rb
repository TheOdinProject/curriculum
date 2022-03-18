require 'rails_helper'

RSpec.describe 'Flagging a Project Submission', type: :system do
  let(:user) { create(:user) }
  let(:lesson) { create(:lesson, :project) }
  let!(:project_submission) { create(:project_submission, lesson: lesson) }

  before do
    sign_in(user)
    visit lesson_path(lesson)
  end

  it 'successfully flags a submission' do
    find(:test_id, 'flag-btn').click
    find(:test_id, 'flag-description-field').fill_in(with: 'It contains offensive material')
    find(:test_id, 'submit-flag-btn').click

    expect(page).to have_content('Thanks for helping us keep our community safe!')
    expect(project_submission.reload.flags.count).to eq(1)
  end
end
