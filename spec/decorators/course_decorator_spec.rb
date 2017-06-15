require 'rails_helper'

RSpec.describe CourseDecorator do
  subject(:course_decorator) { CourseDecorator.new(course) }

  let(:course) {
    double(
      'Course',
      sections: sections,
      title: 'Web Development 101'
    )
  }

  let(:sections) { [section] }
  let(:section) { double('Section') }

  describe '#badge' do
    it 'returns the correct badge for the course' do
      expect(course_decorator.badge).to eql('badge-webdev101.svg')
    end
  end

  describe '#ordered_sections' do

    before do
      allow(sections).to receive(:order).with(position: :asc)
        .and_return(sections)
    end

    it 'returns sections in course' do
      expect(course_decorator.ordered_sections).to eql(sections)
    end
  end
end
