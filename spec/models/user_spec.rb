require 'rails_helper'

RSpec.describe User do
  subject(:user) { create(:user) }

  it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  it { is_expected.to allow_value('example@email.com').for(:email) }
  it { is_expected.to_not allow_value('bademail').for(:email) }
  it { is_expected.to validate_length_of(:username).is_at_least(2).is_at_most(100) }
  it { is_expected.to validate_length_of(:learning_goal).is_at_most(1700) }

  it { is_expected.to have_many(:lesson_completions).dependent(:destroy) }
  it { is_expected.to have_many(:completed_lessons) }
  it { is_expected.to have_many(:project_submissions).dependent(:destroy) }
  it { is_expected.to have_many(:user_providers).dependent(:destroy) }
  it { is_expected.to belong_to(:track) }

  context 'when user is created' do
    let(:mailer) { instance_double(ActionMailer::MessageDelivery) }

    before do
      allow(UserMailer).to receive(:send_welcome_email_to).and_return(mailer)
      allow(mailer).to receive(:deliver_now!)
    end

    it 'sends a welcome email' do
      user = create(:user)
      expect(UserMailer).to have_received(:send_welcome_email_to).with(user)
    end
  end

  describe '#progress_for' do
    let(:course) { build_stubbed(:course) }
    let(:course_progress) { instance_double(CourseProgress) }

    before do
      allow(CourseProgress).to receive(:new).and_return(course_progress)
    end

    it 'returns the course progress service' do
      expect(user.progress_for(course)).to eql(course_progress)
    end
  end

  describe '#completed?' do
    let(:lesson) { create(:lesson) }

    context 'when the user has completed  the lesson' do
      let!(:lesson_completion) { create(:lesson_completion, lesson: lesson, student: user) }

      it 'returns true' do
        expect(user.completed?(lesson)).to be(true)
      end
    end

    context 'when the user has not completed the lesson' do
      let!(:lesson_completion) { create(:lesson_completion, lesson: lesson) }

      it 'returns false' do
        expect(user.completed?(lesson)).to be(false)
      end
    end
  end

  describe '#latest_completed_lesson' do
    let(:lesson_completed_last_week) { create(:lesson) }
    let(:lesson_completed_yesterday) { create(:lesson) }
    let(:lesson_completed_today) { create(:lesson) }

    context 'when the user has completed any lessons' do
      before do
        create(
          :lesson_completion,
          lesson: lesson_completed_last_week,
          student: user,
          created_at: Time.zone.today - 7.days
        )

        create(
          :lesson_completion,
          lesson: lesson_completed_yesterday,
          student: user,
          created_at: Time.zone.today - 1.day
        )

        create(
          :lesson_completion,
          lesson: lesson_completed_today,
          student: user,
          created_at: Time.zone.today
        )
      end

      it 'returns the latest completed lesson' do
        expect(user.latest_completed_lesson).to eql(lesson_completed_today)
      end
    end

    context 'when the user does not have any completed lessons' do
      it 'returns nil' do
        expect(user.latest_completed_lesson).to be(nil)
      end
    end
  end

  describe '#active_for_authentication?' do
    context 'when user has not been banned' do
      let(:user) { create(:user) }

      it 'returns true' do
        expect(user.active_for_authentication?).to be(true)
      end
    end

    context 'when user has been banned' do
      let(:user) { create(:user, banned: true) }

      it 'returns false' do
        expect(user.active_for_authentication?).to be(false)
      end
    end
  end

  describe '#inactive_message' do
    context 'when user has not been banned' do
      let(:user) { create(:user) }

      it 'returns default inactive translation key' do
        expect(user.inactive_message).to eq(:inactive)
      end
    end

    context 'when user has been banned' do
      let(:user) { create(:user, banned: true) }

      it 'returns banned translation key' do
        expect(user.inactive_message).to eq(:banned)
      end
    end
  end
end
