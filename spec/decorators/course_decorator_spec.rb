require 'rails_helper'

RSpec.describe CourseDecorator do
  subject(:course_decorator) { CourseDecorator.new(course) }

  let(:course) do
    instance_double(
      Course,
      title: 'Foundations',
      sections: sections
    )
  end

  let(:sections) { [section] }
  let(:section) { instance_double(Section) }

  describe '#badge' do
    it 'returns the correct badge for the course' do
      expect(course_decorator.badge).to eql('badge-foundations.svg')
    end
  end

  describe '#borderless_badge' do
    it 'returns the correct borderless badge for the course' do
      expect(course_decorator.borderless_badge).to eql('badges/badge-foundations-borderless.svg')
    end
  end

  describe '#sections' do
    let(:decorated_section) { instance_double(SectionDecorator) }
    let(:decorated_sections) { [decorated_section] }

    before do
      allow(SectionDecorator).to receive(:new).with(section).and_return(decorated_section)
    end

    it 'returns decorated sections' do
      expect(course_decorator.sections).to eql(decorated_sections)
    end
  end
end
