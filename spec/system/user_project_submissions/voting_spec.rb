require 'rails_helper'

RSpec.describe 'Voting on User Submissions on the Dashboard', type: :system do
  before do
    user = create(:user)

    create(:project_submission, user: user)
    sign_in(user)
    visit dashboard_path
  end

  it 'the user can vote on their submission' do
    within(:test_project_submission, 1) do
      expect(find(:test_id, 'number-of-likes')).to have_content('0')
      find(:test_id, 'like-btn').click
      expect(find(:test_id, 'number-of-likes')).to have_content('1')
    end
  end

  it 'the user can remove their vote' do
    within(:test_project_submission, 1) do
      find(:test_id, 'like-btn').click
      expect(find(:test_id, 'number-of-likes')).to have_content('1')
      find(:test_id, 'like-btn').click
      expect(find(:test_id, 'number-of-likes')).to have_content('0')
    end
  end
end
