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

    context 'when an error occurs with mail chimp' do
      let(:request) { double('Gibbon::Request', ) }
      let(:mailchimp_list) { double('MailChimp::List', members: members) }
      let(:members) { double('Members') }

      before do
        allow(Gibbon::Request).to receive(:new).and_return(request)
        allow(request).to receive(:lists).and_return(mailchimp_list)
        allow(members).to receive(:create).and_raise(Gibbon::MailChimpError)
      end

      it 'sends the error to new relic' do
        expect(NewRelic::Agent).to receive(:notice_error)

        MailchimpSubscription.new(options).create
      end
    end
  end
end
