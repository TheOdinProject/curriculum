require 'rails_helper'

RSpec.describe CourseHelper do
  let(:lesson) {
    double(
      'Lesson',
      title: 'Ruby Basics',
      id: lesson_id,
      is_project?: lesson_is_project
    )
  }

  let(:lesson_is_project) { false }
  let(:lesson_id) { 1 }
  let(:user) { double('User', completed_lessons: completed_lessons) }
  let(:completed_lessons) { [completion_lesson] }
  let(:completion_lesson) { double('Lesson', id: 1)}

  before do
    allow(helper).to receive(:current_user).
      and_return(user)
  end

  describe '#lesson_completed?' do
    subject { helper.lesson_completed?(user, lesson) }

    it 'returns the completed lesson class' do
      expect(subject).to eql('section-lessons__item__icon--completed')
    end

    context 'when user has not completed the lesson' do
      let(:lesson_id) { 2 }

      it 'returns nil' do
        expect(subject).to eql(nil)
      end
    end
  end

  describe '#numbered_lesson_title' do
    subject { helper.numbered_lesson_title(lesson, lesson_index) }

    let(:lesson_index) { 1 }

    it 'returns the lesson title prepended with its number' do
      expect(subject).to eql('2. Ruby Basics')
    end

    context 'when lesson is a project' do
      let(:lesson_is_project) { true }

      it 'returns the lesson title enclosed in a strong tag' do
        expect(subject).to eql('2. <strong>Ruby Basics</strong>')
      end
    end
  end

  describe '#course_completed_class?' do
    subject { helper.course_completed_class?(course, user) }

    let(:user) { double('User') }
    let(:course) { double('Course') }
    let(:user_signed_in) { true }
    let(:course_completed_by_user) { true}

    before do
      allow(helper).to receive(:user_signed_in?).and_return(user_signed_in)
      allow(helper).to receive(:course_completed_by_user?).with(course, user).
        and_return(course_completed_by_user)
    end

    it 'returns course completed class' do
      expect(subject).to eql('course-card-header--completed')
    end

    context 'when course is not completed' do
      let(:course_completed_by_user) { false }

      it 'returns nil' do
        expect(subject).to be_nil
      end
    end

    context 'when user is not signed in' do
      let(:user_signed_in) { false }

      it 'returns nil' do
        expect(subject).to be_nil
      end
    end
  end

  describe '#open_course_button_style' do
    subject { helper.open_course_button_style(course, user) }

    let(:user) { double('User') }
    let(:course) { double('Course') }
    let(:user_signed_in) { true }
    let(:course_completed_by_user) { true}

    before do
      allow(helper).to receive(:user_signed_in?).and_return(user_signed_in)

      allow(helper).to receive(:course_completed_by_user?).with(course, user).
        and_return(course_completed_by_user)
    end

    it 'returns button--transparent class' do
      expect(subject).to eql('button--transparent')
    end

    context 'when course is not complete' do
      let(:course_completed_by_user) { false }

      it 'returns button--secondary class' do
        expect(subject).to eql('button--secondary')
      end
    end

    context 'when user is not signed in' do
      let(:user_signed_in) { false }

      it 'returns button--secondary class' do
        expect(subject).to eql('button--secondary')
      end
    end
  end
end
