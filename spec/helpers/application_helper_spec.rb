require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe 'title' do
    it 'sets the title' do
      helper.title('Courses')
      expect(helper.content_for(:title)).to eql('Courses | The Odin Project')
    end

    context 'when there is no input' do
      it 'returns nil' do
        expect(title).to be nil
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

  describe 'course progress' do
    let(:user) { double('User') }
    let(:course) { double('Course') }
    let(:course_progress) { double('CourseProgress') }

    before do
      allow(user).to receive(:progress_for).with(course).and_return(course_progress)
    end

    context 'when user has not started the course' do
      before do
        allow(course_progress).to receive_messages(
          started?: false,
          completed?: false,
          percentage: 0
        )
      end

      describe '#course_completed_by_user?' do
        it 'returns false' do
          expect(helper.course_completed_by_user?(course, user)).to eq(false)
        end
      end

      describe '#percentage_completed_by_user' do
        it 'returns 0' do
          expect(helper.percentage_completed_by_user(course, user)).to eql(0)
        end
      end

      describe '#modifier_for_badge' do
        it 'returns the course show progress modifier for the course badge' do
          expect(helper.modifier_for_badge(course, user)).to eql('progress-circle--show-progress')
        end
      end
    end

    context 'when user has started the course' do
      before do
        allow(course_progress).to receive_messages(
          started?: true,
          completed?: false,
          percentage: 30
        )
      end

      describe '#course_completed_by_user?' do
        it 'returns false' do
          expect(helper.course_completed_by_user?(course, user)).to eq(false)
        end
      end

      describe '#percentage_completed_by_user' do
        it 'returns 30' do
          expect(helper.percentage_completed_by_user(course, user)).to eql(30)
        end
      end

      describe '#modifier_for_badge' do
        it 'returns the course show progress modifier for the course badge' do
          expect(helper.modifier_for_badge(course, user)).to eql('progress-circle--show-progress')
        end
      end
    end

    context 'when user has completed the course' do
      before do
        allow(course_progress).to receive_messages(
          started?: true,
          completed?: true,
          percentage: 100
        )
      end

      describe '#course_completed_by_user?' do
        it 'returns true' do
          expect(helper.course_completed_by_user?(course, user)).to eq(true)
        end
      end

      describe '#percentage_completed_by_user' do
        it 'returns 100' do
          expect(helper.percentage_completed_by_user(course, user)).to eql(100)
        end
      end

      describe '#modifier_for_badge' do
        it 'returns the course completed modifier for the course badge' do
          expect(helper.modifier_for_badge(course, user)).to eql('progress-circle--completed')
        end
      end
    end
  end

  describe '#next_lesson_to_complete' do
    let(:course) { double('Course') }
    let(:lesson_completions) { [lesson_completion] }
    let(:lesson_completion) { double('LessonCompletion') }
    let(:next_lesson) { double('NextLesson', to_complete: lesson_to_complete) }
    let(:lesson_to_complete) { double('Lesson') }

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
      let!(:unread_notification) { create(:notification, recipient: user, read_at: nil) }

      it 'returns true' do
        expect(helper.unread_notifications?(user)).to be true
      end
    end

    context 'when the user has no unread notifications' do
      let!(:read_notification) { create(:notification, recipient: user, read_at: Time.zone.now) }

      it 'returns false' do
        expect(helper.unread_notifications?(user)).to be false
      end
    end
  end
end
