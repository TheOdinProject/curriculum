require 'rails_helper'

RSpec.describe SectionDecorator do
  subject(:section_decorator) { described_class.new(section) }

  let(:section) { instance_double(Section, lessons: lessons) }
  let(:lessons) { [lesson] }
  let(:lesson) { instance_double(Lesson) }

  describe '#lessons' do
    let(:decorated_lesson) { instance_double(LessonDecorator) }
    let(:decorated_lessons) { [decorated_lesson] }

    before do
      allow(LessonDecorator).to receive(:new).with(lesson).and_return(decorated_lesson)
    end

    it 'returns decorated lessons' do
      expect(section_decorator.lessons).to eql(decorated_lessons)
    end
  end
end
