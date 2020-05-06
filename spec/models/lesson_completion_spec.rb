require 'rails_helper'

RSpec.describe LessonCompletion do
  subject { described_class.new }

  it { is_expected.to validate_presence_of(:student_id) }
  it { is_expected.to validate_presence_of(:lesson_id) }

  it { is_expected.to belong_to(:student) }
  it { is_expected.to belong_to(:lesson) }

  describe '.created_today' do
    let(:student) { create(:user) }
    let(:lesson_one) { create(:lesson) }
    let(:lesson_two) { create(:lesson) }

    let(:lesson_completed_today) do
      create(:lesson_completion, created_at: Time.zone.today, student: student, lesson: lesson_one)
    end

    let(:lesson_not_completed_today) do
      create(:lesson_completion, created_at: Time.zone.today - 2.days, student: student, lesson: lesson_one)
    end

    it 'returns lessons completed today' do
      expect(LessonCompletion.created_today).to include(lesson_completed_today)
    end
  end
end
