require 'rails_helper'

RSpec.describe 'Switching Paths', type: :system do
  let!(:default_path) { create(:path, title: 'Foundations', default_path: true) }
  let!(:rails_path) { create(:path, title: 'Rails') }
  let!(:user) { create(:user, path: default_path) }

  before do
    sign_in(user)
  end

  context 'on the paths index page' do
    it 'allows a user to switch paths' do
      visit paths_path

      expect(find(:test_id, 'foundations-resume-path-btn').value).to eq('Resume')
      expect(find(:test_id, 'rails-switch-path-btn').value).to eq('Switch')

      find(:test_id, 'rails-switch-path-btn').click

      expect(page).to have_css '.alert-success'
      expect(find(:test_id, 'flash')).to have_text 'You have switched to the Rails path'
      expect(user.reload.path).to eq rails_path
    end
  end

  context 'on the path show page' do
    it 'allows a user to switch to that path' do
      visit path_path(rails_path)
      find(:test_id, 'rails-switch-path-btn').click

      expect(page).to have_css '.alert-success'
      expect(find(:test_id, 'flash')).to have_text 'You have switched to the Rails path'
      expect(user.reload.path).to eq rails_path
    end
  end
end
