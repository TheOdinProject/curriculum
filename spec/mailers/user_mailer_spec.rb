require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe '#send_welcome_email_to' do
    subject(:welcome_email) { UserMailer.send_welcome_email_to(user, token) }

    let(:user) { FactoryGirl.create(:user, email: 'kevin@example.com') }
    let(:token) { 'foo123' }
    let(:lesson) {
      double('Lesson', title: 'First lesson', title_url: 'first-lesson')
    }
    let(:lessons) { [lesson] }

    before do
      allow(Lesson).to receive(:order).with(position: :asc).and_return(lessons)
    end

    it 'renders the correct sender address' do
      expect(welcome_email.from).to eql(['no-reply@theodinproject.com'])
    end

    it 'renders the correct token' do
      expect(welcome_email.body.encoded).to match('foo123')
    end

    it 'renders a link to the correct first lesson' do
      expect(welcome_email.body.encoded).to match('first-lesson')
    end

    it 'includes an attachment' do
      expect(welcome_email.attachments.count).to eql(1)
    end

    it 'renders the correct attachment' do
      expect(welcome_email.attachments[0].filename).to eql('logo.gif')
    end

    it 'renders the correct subject' do
      expect(welcome_email.subject)
        .to eql('Getting started with The Odin Project')
    end

    it 'sends the email to the correct address' do
      expect(welcome_email.to).to eql(['kevin@example.com'])
    end

    it 'sends to the correct bcc' do
      expect(welcome_email.bcc).to eql(['erik@theodinproject.com'])
    end
  end
end
