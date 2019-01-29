require 'rails_helper'

RSpec.describe LessonSerializer do
  subject { described_class.new(lesson, days) }

  let(:lesson) do
    double('Lesson', title: 'Overview', lesson_completions: lesson_completions)
  end
  let(:days) { nil }
  let(:lesson_completions) { [old_lesson_completion, new_lesson_completion] }
  let(:new_lesson_completion) do
    double('LessonCompletion', created_at: DateTime.now - 1.days)
  end
  let(:old_lesson_completion) do
    double('LessonCompletion', created_at: DateTime.now - 40.days)
  end

  describe '#as_json' do
    let(:serialized_lesson) do
      {
        title: 'Overview',
        completions: 2
      }
    end

    it 'returns a serialized lesson' do
      expect(subject.as_json).to eql(serialized_lesson)
    end

    context 'when days is not nil' do
      let(:days) { 7 }

      let(:serialized_lesson) do
        {
          title: 'Overview',
          completions: 1,
        }
      end

      before do
        allow(lesson_completions).to receive(:where).
          with("created_at > ?", DateTime.now - days).
            and_return([new_lesson_completion])
      end

      it 'returns a serialized lesson' do
        expect(subject.as_json).to eql(serialized_lesson)
      end
    end
  end
end
