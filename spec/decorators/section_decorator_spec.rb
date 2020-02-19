require 'rails_helper'

RSpec.describe SectionDecorator do
  subject(:section_decorator) { SectionDecorator.new(section) }

  let(:section) { double('Section', lessons: lessons) }
  let(:lessons) { [lesson] }
  let(:lesson) { double('Lesson') }

  describe '#lessons' do
    let(:decorated_lesson) { double('LessonDecorator') }
    let(:decorated_lessons) { [decorated_lesson] }

    before do
      allow(LessonDecorator).to receive(:new).with(lesson).
        and_return(decorated_lesson)
    end

    it 'returns decorated lessons' do
      expect(section_decorator.lessons).to eql(decorated_lessons)
    end
  end
end
