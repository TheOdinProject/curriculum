require 'rails_helper'

RSpec.describe MailchimpSubscription do
  let(:email) { 'kevin@fizbaz.com' }
  let(:username) { 'kevin' }
  let(:signup_date) { Date.new }
  let(:options) do
    {
      email: email,
      username: username,
      signup_date: signup_date
    }
  end
  let(:list_id) { ENV['MAILCHIMP_LIST_ID'] }

  describe '#create' do
    it 'creates a mailchimp subscription with the initialized parameters', :vcr, if: ENV['MAILCHIMP_LIST_ID'] do
      mailchimp_remove_member(email, list_id)
      MailchimpSubscription.new(options).create
      expect(mailchimp_member_exists?(email, list_id)).to eq(true)
    end
  end
end
