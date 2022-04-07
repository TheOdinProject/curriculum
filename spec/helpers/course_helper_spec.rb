require 'rails_helper'

RSpec.describe CourseHelper do
  describe '#course_completed_class?' do
    let(:user) { instance_double(User) }
    let(:course) { instance_double(Course) }
    let(:signed_in) { true }
    let(:course_completed) { true }

    before do
      allow(helper).to receive(:user_signed_in?).and_return(signed_in)
      allow(helper).to receive(:course_completed_by_user?).and_return(course_completed)
    end

    context 'when the user is signed in and they have completed the course' do
      it 'returns course completed class' do
        expect(helper.course_completed_class?(course, user)).to eql('course-card-header--completed')
      end
    end

    context 'when course is not completed' do
      let(:course_completed) { false }

      it 'returns nil' do
        expect(helper.course_completed_class?(course, user)).to be_nil
      end
    end

    context 'when user is not signed in' do
      let(:signed_in) { false }

      it 'returns nil' do
        expect(helper.course_completed_class?(course, user)).to be_nil
      end
    end
  end

  describe '#open_course_button_style' do
    let(:user) { instance_double(User) }
    let(:course) { instance_double(Course) }
    let(:signed_in) { true }
    let(:course_completed) { true }

    before do
      allow(helper).to receive(:user_signed_in?).and_return(signed_in)
      allow(helper).to receive(:course_completed_by_user?).and_return(course_completed)
    end

    context 'when the user is signed in and they have completed the course' do
      it 'returns button--transparent class' do
        expect(helper.open_course_button_style(course, user)).to eql('button--transparent')
      end
    end

    context 'when course has not been completed' do
      let(:course_completed) { false }

      it 'returns button--secondary class' do
        expect(helper.open_course_button_style(course, user)).to eql('button--secondary')
      end
    end

    context 'when user is not signed in' do
      let(:signed_in) { false }

      it 'returns button--secondary class' do
        expect(helper.open_course_button_style(course, user)).to eql('button--secondary')
      end
    end
  end
end
