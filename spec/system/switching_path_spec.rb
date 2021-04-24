require 'rails_helper'

RSpec.describe 'Switching Paths', type: :system do
  let!(:default_path) { create(:path, title: 'Foundations', default_path: true) }
  let!(:unselected_path) { create(:path, title: 'Rails') }

  before do
    sign_in(create(:user, path: default_path))
  end

  context 'on the paths index page' do
    it 'allows a user to switch paths' do
      visit paths_path

      expect(find(:test_id, 'Foundations').value).to eq('Resume')
      expect(find(:test_id, 'Rails').value).to eq('Switch')

      find(:test_id, 'Rails').click

      expect(page).to have_css '.alert-success'
      expect(find(:test_id, 'flash')).to have_text 'You have switched to the Rails path'
    end
  end

  context 'on the path show page' do
    it 'allows a user to switch to that path' do
      visit path_path(unselected_path)

      expect(find(:test_id, 'Rails').value).to eq('Switch Path')

      find(:test_id, 'Rails').click

      expect(page).to have_css '.alert-success'
      expect(find(:test_id, 'flash')).to have_text 'You have switched to the Rails path'
    end
  end
end
