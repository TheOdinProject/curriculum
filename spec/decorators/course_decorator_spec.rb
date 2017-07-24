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
end
