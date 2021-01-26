require 'rails_helper'

RSpec.describe WelcomeEmailJob do
  subject(:job) { described_class.new }

  describe '#perform' do
    let(:mailer) { instance_double(ActionMailer::MessageDelivery) }

    before do
      allow(UserMailer).to receive(:send_welcome_email_to).and_return(mailer)
      allow(mailer).to receive(:deliver_now!)
    end

    context 'when the user exists' do
      before do
        create(:user, id: 1000)
      end

      it 'sends a welcome email to them' do
        job.perform(1000)
        expect(mailer).to have_received(:deliver_now!)
      end
    end

    context 'when the user does not exist' do
      it 'does not send a welcome email to them' do
        job.perform(1000)
        expect(mailer).not_to have_received(:deliver_now!)
      end
    end
  end
end
