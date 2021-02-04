require 'rails_helper'

RSpec.describe MailingListJob do
  subject(:job) { described_class.new }

  describe '#perform' do
    let!(:user) do
      create(
        :user,
        id: 1001,
        email: 'john@email.com',
        username: 'A USERNAME',
        created_at: Time.utc(2021, 1, 1, 15)
      )
    end

    before do
      allow(MailchimpSubscription).to receive(:create)
    end

    it 'adds the user to the mailing list' do
      job.perform(1001)

      expect(MailchimpSubscription).to have_received(:create)
        .with(email: 'john@email.com', username: 'A USERNAME', signup_date: Time.utc(2021, 1, 1, 15))
    end
  end
end
