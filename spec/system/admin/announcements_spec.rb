require 'rails_helper'

RSpec.describe 'Announcements', type: :system do
  let(:user) { create(:user, admin: true) }

  before do
    sign_in(user)
  end

  context 'when creating a new announcement' do
    before do
      visit new_admin_announcement_path
      fill_in :announcement_message, with: 'Test Message'
      fill_in :announcement_expires, with: 10.days.from_now.to_date.to_s(:db)
      find_button('Create Announcement').trigger('click')
    end

    it 'displays the announcement title on the index page' do
      visit admin_announcements_path
      expect(page).to have_content('Test Message')
    end

    it 'displays the announcement date on the index page' do
      visit admin_announcements_path
      expect(page).to have_content(10.days.from_now.to_date.to_s(:long))
    end

    it 'displays the announcement on the users dashboard' do
      visit dashboard_path
      expect(page).to have_content('Test Message')
    end
  end
end
