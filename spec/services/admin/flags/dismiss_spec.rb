require 'rails_helper'

RSpec.describe Admin::Flags::Dismiss do
  let(:admin) { create(:user, admin: true) }

  subject(:service) { described_class.call(admin, flag: flag) }

  let(:flag) { create(:flag) }

  describe '#call' do
    it 'sets the flags taken action to dimiss' do
      expect { service }.to change { flag.taken_action }.from('pending').to('dismiss')
    end

    it 'sets the flags status to resolved' do
      expect { service }.to change { flag.status }.from('active').to('resolved')
    end

    it 'sets the resolved_by_id to the id of the current admin user' do
      expect { service }.to change { flag.resolved_by_id }.from(nil).to(admin.id)
    end
  end

  describe '#success?' do
    it 'returns true' do
      expect(service.success?).to be(true)
    end
  end
end
