require 'rails_helper'

RSpec.describe Point do
  subject { Point.new(discord_id: '123') }

  it { is_expected.to validate_presence_of(:discord_id) }
  it { is_expected.to validate_uniqueness_of(:discord_id).case_insensitive }

  describe '#increment_points_by' do
    let(:user_points) { Point.create(discord_id: '1234') }

    it 'increments the points by 1' do
      expect { user_points.increment_points_by(1) }.to change(user_points, :points).from(0).to(1)
    end

    it 'increments the points by 2' do
      expect { user_points.increment_points_by(2) }.to change(user_points, :points).from(0).to(2)
    end

    it 'increments the points by 5' do
      expect { user_points.increment_points_by(5) }.to change(user_points, :points).from(0).to(5)
    end

    it 'does not increment the points by 0' do
      expect { user_points.increment_points_by(0) }.not_to change(user_points, :points)
    end

    it 'does not increment the points by 6' do
      expect { user_points.increment_points_by(6) }.not_to change(user_points, :points)
    end
  end
end
