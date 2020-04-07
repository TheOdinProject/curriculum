require 'rails_helper'

RSpec.describe LessonSerializer do
  subject { described_class.as_json(lesson, between_dates) }

  let(:lesson) do
    double('Lesson', title: 'Overview', lesson_completions: lesson_completions)
  end
  let(:between_dates) do
    (DateTime.parse('2019/01/01')..DateTime.parse('2019/12/31'))
  end
  let(:lesson_completions) { [lesson_completion] }
  let(:lesson_completion) do
    double('LessonCompletion', created_at: '2019/01/10')
  end

  describe '#as_json' do
    let(:serialized_lesson) do
      {
        title: 'Overview',
        completions: 1
      }
    end

    before do
      allow(lesson_completions).to receive(:where).
        with(created_at: between_dates).and_return([lesson_completion])
    end

    it { is_expected.to eql(serialized_lesson) }
  end
end
