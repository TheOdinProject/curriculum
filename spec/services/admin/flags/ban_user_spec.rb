require 'rails_helper'

RSpec.describe Admin::Flags::BanUser do
  subject(:service) { described_class.call(flag: flag) }

  let(:flag) { create(:flag, project_submission: project_submission) }
  let(:project_submission) { create(:project_submission, user: user) }
  let(:user) { create(:user) }

  describe '#call' do
    it 'sets the flagged project submission to banned' do
      expect { service }.to change { project_submission.banned }.from(false).to(true)
    end

    it 'sets the flagged project submissions owner to banned' do
      expect { service }.to change { user.banned }.from(false).to(true)
    end

    it 'sets the flags taken action to ban' do
      expect { service }.to change { flag.taken_action }.from('pending').to('ban')
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
