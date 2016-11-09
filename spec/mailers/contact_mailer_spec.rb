require 'rails_helper'

RSpec.describe ContactMailer, type: :mailer do
  describe '#suggestion_email' do
    let(:suggestion_email) {
      ContactMailer.suggestion_email( 'hello', '/home', 'kevin@example.com')
    }

    it 'renders the correct subject' do
      expect(suggestion_email.subject).to eql('Site FEEDBACK')
    end

    it 'sends to the correct email' do
      expect(suggestion_email.to).to eql(['feedback@theodinproject.com'])
    end

    it 'sends from the correct email' do
      expect(suggestion_email.from).
        to eql(['admin@theodinproject.com'])
    end

    it 'renders the correct suggestion text' do
      expect(suggestion_email.body.encoded).to match('hello')
    end

    it 'renders the url the user sent the email from' do
      expect(suggestion_email.body.encoded).to match('/home')
    end

    it 'renders the sending users email address' do
      expect(suggestion_email.body.encoded).to include('kevin@example.com')
    end
  end
end
