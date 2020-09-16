require 'rails_helper'

RSpec.describe Admin::Flags::Dismiss do
  subject(:service) { described_class.call(flag: flag) }

  let(:flag) { create(:flag) }

  describe '#call' do
    it 'sets the flags taken action to dimiss' do
      expect { service }.to change { flag.taken_action }.from('pending').to('dismiss')
    end

    it 'sets the flags status to resolved' do
      expect { service }.to change { flag.status }.from('active').to('resolved')
    end
  end

  describe '#success?' do
    it 'returns true' do
      expect(service.success?).to be(true)
    end
  end
end
