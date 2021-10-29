require 'rails_helper'

RSpec.describe CourseDecorator do
  subject(:course_decorator) { CourseDecorator.new(course) }

  let(:course) { instance_double(Course, sections: sections) }
  let(:sections) { [section] }
  let(:section) { instance_double(Section) }

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
