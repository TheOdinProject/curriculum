require 'rails_helper'

RSpec.describe 'Admin Flashes', type: :system do
  let(:user) { create(:user, admin: true) }

  before do
    sign_in(user)
  end

  context 'when creating a new admin flash' do
    before do
      visit new_admin_admin_flash_path
      fill_in :admin_flash_message, with: 'Test Message'
      fill_in :admin_flash_expires, with: 10.days.from_now.to_date.to_s(:db)
      find_button('Create Admin flash').trigger('click')
    end

    it 'displays the flash title on the index page' do
      visit admin_admin_flashes_path
      expect(page).to have_content('Test Message')
    end

    it 'displays the flash date on the index page' do
      visit admin_admin_flashes_path
      expect(page).to have_content(10.days.from_now.to_date.to_s(:long))
    end

    it 'displays the flash on the User Dashboard' do
      visit dashboard_path
      expect(page).to have_content('Test Message')
    end
  end
end
