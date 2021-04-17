require 'rails_helper'

RSpec.describe 'Sign Up', type: :system do
  before do
    create(:path, title: 'Foundations', default_path: true)
  end

  it 'signs up successfully' do
    visit root_path
    find(:test_id, 'sign_up').click
    find(:test_id, 'username_field').fill_in(with: 'codesquad64')
    find(:test_id, 'email_field').fill_in(with: 'codesquad64@gmail.com')
    find(:test_id, 'password_field').fill_in(with: 'partyparrot128')
    find(:test_id, 'password_confirmation_field').fill_in(with: 'partyparrot128')
    find(:test_id, 'submit_btn').click

    expect(find(:test_id, 'profile_username')).to have_content('codesquad64')
  end
end
