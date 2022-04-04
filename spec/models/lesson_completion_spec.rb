require 'rails_helper'

RSpec.describe LessonCompletion do
  subject { described_class.new }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:lesson) }

  it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:lesson_id) }

  describe '.created_today' do
    let!(:lesson_completed_today) do
      create(:lesson_completion, created_at: Time.zone.today)
    end

    let!(:lesson_not_completed_today) do
      create(:lesson_completion, created_at: Time.zone.today - 2.days)
    end

    it 'returns lessons completed today' do
      expect(described_class.created_today).to contain_exactly(lesson_completed_today)
    end
  end
end
