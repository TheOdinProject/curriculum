require 'rails_helper'

RSpec.describe CourseSerializer do
  subject { described_class.as_json(course, days) }

  let(:course) do
    double(
      'Section',
      title: 'Web Development 101',
      sections: sections,
    )
  end
  let(:days) { 7 }
  let(:sections) { [section] }
  let(:section) { double('Section') }
  let(:serialized_section) do
    {
      title: 'Installations',
      lessons: [{ title: 'Overview', completions: 1 }],
    }
  end

  describe '#as_json' do
    let(:serialized_course) do
      {
        title: 'Web Development 101',
        sections: [serialized_section],
      }
    end

    before do
      allow(SectionSerializer).to receive(:as_json).with(section, days).
        and_return(serialized_section)
    end

    it { is_expected.to eql(serialized_course) }
  end
end
