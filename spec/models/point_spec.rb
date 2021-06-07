require 'rails_helper'

RSpec.describe Point do
  subject { Point.new(discord_id: '123') }

  it { is_expected.to validate_presence_of(:discord_id) }
  it { is_expected.to validate_uniqueness_of(:discord_id).case_insensitive }

  describe '#increment_points' do
    let(:user_points) { Point.create(discord_id: '1234') }

    it 'increments the points' do
      expect { user_points.increment_points }.to change { user_points.reload.points }.from(0).to(1)
    end
  end
end
