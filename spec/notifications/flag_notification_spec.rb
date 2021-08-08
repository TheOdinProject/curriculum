require 'rails_helper'

RSpec.describe FlagNotification do
  subject(:flag_notification) { described_class }
  let(:flag) { create(:flag) }
  let(:recipient) { create(:user) }
  let(:title) { 'Test title' }
  let(:url) { '/test_path' }
  let(:message) { 'test message' }

  describe 'database delivery' do
    it 'allows a valid FlagNotification to be saved' do
      expect { flag_notification.with(flag: flag, title: title, url: url, message: message).deliver(recipient) }
        .to change { Notification.count }.from(0).to(1)
    end
  end

  describe 'param' do
    it 'requires flag to be present in the params' do
      expect { flag_notification.with(title: title, url: url, message: message).deliver(recipient) }
        .to raise_error(Noticed::ValidationError, /flag is missing/)
    end

    it 'requires url to be present in the params' do
      expect { flag_notification.with(flag: flag, title: title, message: message).deliver(recipient) }
        .to raise_error(Noticed::ValidationError, /url is missing/)
    end

    it 'requires message to be present in the params' do
      expect { flag_notification.with(flag: flag, title: title, url: url).deliver(recipient) }
        .to raise_error(Noticed::ValidationError, /message is missing/)
    end

    it 'requires title to be present in the params' do
      expect { flag_notification.with(flag: flag, url: url, message: message).deliver(recipient) }
        .to raise_error(Noticed::ValidationError, /title is missing/)
    end
  end
end
