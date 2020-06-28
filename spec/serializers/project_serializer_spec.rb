require 'rails_helper'

RSpec.describe ProjectSerializer do
  subject { described_class.as_json(project) }

  let(:project) do
    instance_double(
      Project,
      id: 1,
      repo_url: 'www.repourl.com/path',
      live_preview_url: 'www.livepreviewurl.com/path',
      is_public: false,
      user: user
    )
  end
  let(:user) { instance_double(User, id: 123, username: "A USERNAME") }

  describe '#as_json' do
    let(:serialized_project) do
      {
        id: 1,
        repo_url: 'www.repourl.com/path',
        live_preview_url: 'www.livepreviewurl.com/path',
        is_public: false,
        user_name: "A USERNAME",
        user_id: 123,
      }
    end

    it { is_expected.to eql(serialized_project) }
  end
end
