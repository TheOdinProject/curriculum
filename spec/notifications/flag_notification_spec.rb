require 'rails_helper'

RSpec.describe FlagNotification do
  subject(:flag_notification) { described_class }
  let(:flag) { create(:flag) }
  let(:recipient) { create(:user) }

  describe 'database delivery' do
    it 'allows a valid FlagNotification to be saved' do
      expect { flag_notification.with(flag: flag).deliver(recipient) }.to change { Notification.count }.by(1)
    end
  end

  describe 'param' do
    it 'requires the flag attribute to be set in the params attribute' do
      expect { flag_notification.with({}).deliver(recipient) }.to raise_error(Noticed::ValidationError)
    end
  end
end
