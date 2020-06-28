require 'rails_helper'

RSpec.describe SectionSerializer do
  subject { described_class.as_json(section, between_dates) }

  let(:section) do
    double(
      'Section',
      title: 'Installations',
      lessons: lessons,
    )
  end
  let(:between_dates) do
    (DateTime.parse('2019/01/01')..DateTime.parse('2019/12/31'))
  end
  let(:lessons) { [lesson] }
  let(:lesson) { double('Lesson') }
  let(:serialized_lesson) do
    {
      title: 'Overview',
      completions: 1,
    }
  end

  describe '#as_json' do
    let(:serialized_section) do
      {
        title: 'Installations',
        lessons: [serialized_lesson],
      }
    end

    before do
      allow(LessonSerializer).to receive(:as_json).with(lesson, between_dates).
        and_return(serialized_lesson)
    end

    it { is_expected.to eql(serialized_section) }
  end
end
