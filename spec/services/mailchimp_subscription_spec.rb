require 'rails_helper'

RSpec.describe MailchimpSubscription do
  subject { described_class.create(options) }

  let(:options) do
    {
      email: email,
      username: username,
      signup_date: signup_date,
    }
  end
  let(:email) { 'kevin@fizbaz.com' }
  let(:username) { 'kevin' }
  let(:signup_date) { Date.new }
  let(:list_id) { ENV['MAILCHIMP_LIST_ID'] }
  let(:subscriber_details) do
    {
      email_address: email,
      status: :subscribed,
      merge_fields: {
        USERNAME: username,
        SIGNUPDATE: signup_date,
      },
    }
  end

  describe '#create' do
    let(:request) { double('Gibbon::Request') }
    let(:mailchimp_list) { double('MailChimp::List', members: members) }
    let(:members) { double('Members') }

    before do
      allow(Gibbon::Request).to receive(:new).and_return(request)
      allow(request).to receive(:lists).and_return(mailchimp_list)
      allow(members).to receive(:create)
    end

    it 'creates a mailchimp subscription' do
      subject

      expect(members).to have_received(:create).with(body: subscriber_details)
    end

    context 'when an error occurs with mail chimp' do
      before do
        allow(members).to receive(:create).and_raise(Gibbon::MailChimpError)
        allow(NewRelic::Agent).to receive(:notice_error)
      end

      it 'sends the error to new relic' do
        described_class.new(options).create

        expect(NewRelic::Agent).to have_received(:notice_error)
      end
    end
  end
end
