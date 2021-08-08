require 'rails_helper'

RSpec.describe Admin::Flags::NotifyUser do
  subject(:service) { described_class.call(admin: admin, flag: flag) }

  let(:admin) { create(:user, admin: true) }
  let(:flag) { create(:flag, project_submission: project_submission) }
  let(:project_submission) { create(:project_submission, user: user) }
  let(:user) { create(:user) }

  describe '#call' do
    it 'sets the flags taken action to notified_user' do
      expect { service }.to change { flag.taken_action }.from('pending').to('notified_user')
    end

    it 'sets the flags status to resolved' do
      expect { service }.to change { flag.status }.from('active').to('resolved')
    end

    it 'sets the resolved_by_id to the id of the current admin user' do
      expect { service }.to change { flag.resolved_by_id }.from(nil).to(admin.id)
    end

    it 'creates a notification' do
      expect { service }.to change { Notification.count }.from(0).to(1)
    end
  end
end
