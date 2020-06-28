require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe '#send_welcome_email_to' do
    subject(:welcome_email) { UserMailer.send_welcome_email_to(user) }

    let(:user) { FactoryBot.create(:user, email: 'kevin@example.com') }


    it 'renders the correct sender address' do
      expect(welcome_email.from).to eql(['no-reply@theodinproject.com'])
    end

    it 'includes an attachment' do
      expect(welcome_email.attachments.count).to eql(1)
    end

    it 'renders the correct attachment' do
      expect(welcome_email.attachments[0].filename).to eql('logo.svg')
    end

    it 'renders the correct subject' do
      expect(welcome_email.subject)
        .to eql('Getting started with The Odin Project')
    end

    it 'sends the email to the correct address' do
      expect(welcome_email.to).to eql(['kevin@example.com'])
    end

  end
end
