require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe 'title' do
    it 'sets the title' do
      helper.title('Courses')
      expect(helper.content_for(:title)).to eql('Courses | The Odin Project')
    end

    context 'when there is no input' do
      it 'returns nil' do
        expect(title).to be_nil
      end
    end
  end

  describe '#bootstrap_class_for' do
    let(:flash_type) { 'alert' }

    it 'returns the bootstrap alert class' do
      expect(helper.bootstrap_class_for(flash_type)).to eql('alert-danger')
    end

    context 'when flash type is notice' do
      let(:flash_type) { 'notice' }

      it 'returns the bootstrap success class' do
        expect(helper.bootstrap_class_for(flash_type)).to eql('alert-success')
      end
    end

    context 'when custom flash type' do
      let(:flash_type) { 'error' }

      it 'returns the bootstrap success class' do
        expect(helper.bootstrap_class_for(flash_type)).to eql('alert-error')
      end
    end
  end

  describe '#percentage_completed_by_user' do
    subject(:percentage_completed_by_user) { helper.percentage_completed_by_user(course, user) }

    let(:course) { instance_double(Course) }
    let(:user) { instance_double(User) }

    before do
      allow(user).to receive(:progress_for).and_return(course_progress)
    end

    context 'when user has not started the course' do
      let(:course_progress) { instance_double(CourseProgress, percentage: 0) }

      it 'returns 0%' do
        expect(percentage_completed_by_user).to eq(0)
      end
    end

    context 'when user has started the course' do
      let(:course_progress) { instance_double(CourseProgress, percentage: 30) }

      it 'returns 30%' do
        expect(percentage_completed_by_user).to eq(30)
      end
    end

    context 'when user has completed the course' do
      let(:course_progress) { instance_double(CourseProgress, percentage: 100) }

      it 'returns 100%' do
        expect(percentage_completed_by_user).to eq(100)
      end
    end
  end

  describe '#course_completed_by_user?' do
    subject(:course_completed_by_user?) { helper.course_completed_by_user?(course, user) }

    let(:user) { instance_double(User) }
    let(:course) { instance_double(Course) }

    before do
      allow(user).to receive(:progress_for).with(course).and_return(course_progress)
    end

    context 'when the user has completed the course' do
      let(:course_progress) { instance_double(CourseProgress, completed?: true) }

      it { is_expected.to be(true) }
    end

    context 'when the user has not completed the course' do
      let(:course_progress) { instance_double(CourseProgress, completed?: false) }

      it { is_expected.to be(false) }
    end
  end

  describe '#next_lesson_to_complete' do
    let(:course) { instance_double(Course) }
    let(:lesson_completions) { [lesson_completion] }
    let(:lesson_completion) { instance_double(LessonCompletion) }
    let(:next_lesson) { instance_double(NextLesson, to_complete: lesson_to_complete) }
    let(:lesson_to_complete) { instance_double(Lesson) }

    before do
      allow(NextLesson).to receive(:new).with(course, lesson_completions).and_return(next_lesson)
    end

    it 'returns the next lesson the user has to complete' do
      expect(helper.next_lesson_to_complete(course, lesson_completions)).to eql(lesson_to_complete)
    end
  end

  describe '#unread_notifications' do
    let!(:user) { create(:user) }

    context 'when the user has unread notifications' do
      it 'returns true' do
        create(:notification, recipient: user, read_at: nil)

        expect(helper.unread_notifications?(user)).to be true
      end
    end

    context 'when the user has no unread notifications' do
      it 'returns false' do
        create(:notification, recipient: user, read_at: Time.zone.now)

        expect(helper.unread_notifications?(user)).to be false
      end
    end
  end
end
