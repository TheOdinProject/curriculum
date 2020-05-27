require 'rails_helper'

RSpec.describe ProjectSerializer do
  subject { described_class.as_json(project) }

  let(:project) do
    instance_double(
      Project,
      id: 1,
      repo_url: 'www.repourl.com/path',
      live_preview_url: 'www.livepreviewurl.com/path',
      user: user
    )
  end
  let(:user) { instance_double(User, username: "A USERNAME") }

  describe '#as_json' do
    let(:serialized_project) do
      {
        id: 1,
        repo_url: 'www.repourl.com/path',
        live_preview_url: 'www.livepreviewurl.com/path',
        user_name: "A USERNAME",
      }
    end

    it { is_expected.to eql(serialized_project) }
  end
end
