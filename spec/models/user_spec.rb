require 'rails_helper'

RSpec.describe User do
  subject(:user) {
    User.new(
      username: 'kevin',
      email: 'kevin@example.com',
      legal_agreement: 'true',
      password: 'foobar',
      provider: provider,
      uid: '',
    )
  }
  let(:provider) { '' }

  let(:lesson_completions) {
    [first_lesson_completion, second_lesson_completion]
  }
  let(:first_lesson_completion) {
    double('LessonCompletion', student_id: 1, created_at: DateTime.new(2016,11,11), lesson_id: 1)
  }
  let(:second_lesson_completion) {
     double('LessonCompletion', student_id: 1, created_at: DateTime.new(2016,11,8), lesson_id: 2)
   }
   let(:completed_lessons) {
     [first_lesson_completion]
  }

  before do
    allow(user).to receive(:lesson_completions).and_return(lesson_completions)
    allow(user).to receive(:completed_lessons).and_return(completed_lessons)
    allow(Lesson).to receive(:find).with(2).and_return(second_lesson_completion)

    allow(lesson_completions).to receive(:order).with(created_at: :asc).
      and_return(lesson_completions)
  end

  it { is_expected.to validate_uniqueness_of(:username) }
  it { is_expected.to validate_presence_of(:legal_agreement).
      with_message("Don't forget the legal stuff!") }
  it { is_expected.to validate_length_of(:username) }
  it { is_expected.to have_many(:lesson_completions) }
  it { is_expected.to have_many(:completed_lessons) }

  describe '.by_latest_completion' do
    let(:first_user) {
      double(
        'User',
        id: 1,
        lesson_completions: [completed_lesson],
      )
    }

    let(:completed_lesson) {
       double(
        'LessonCompletion',
        student_id: 1,
        created_at: DateTime.new(2016,11,7),
      )
    }

    let(:second_user) {
      double(
        'User',
        id: 2,
        lesson_completions: [second_completed_lesson],
      )
    }

    let(:second_completed_lesson) {
      double(
        'LessonCompletion',
        student_id: 2,
        created_at: DateTime.new(2016,11,10),
      )
    }
    let(:users_completed_lessons) { double('ActiveRecord::Relation') }
    let(:users_by_last_completed_lesson) { double('ActiveRecord::Relation') }
    let(:grouped_by_users) { double('ActiveRecord::Relation') }

    before do
      allow(User).to receive(:left_outer_joins).
        with(:lesson_completions).
        and_return(users_completed_lessons)

      allow(users_completed_lessons).to receive(:select).
        with('max(lesson_completions.created_at) as latest_completion_date, users.*').
        and_return(users_by_last_completed_lesson)

      allow(users_by_last_completed_lesson).to receive(:group).with('users.id').
        and_return(grouped_by_users)


      allow(grouped_by_users).to receive(:order).
        with('latest_completion_date desc nulls last').
        and_return([second_user, first_user])
    end

    it 'returns users ordered by thier latest lesson completion' do
      expect(User.by_latest_completion).to eql([second_user, first_user])
    end
  end

  describe '#completed_lesson?' do
    it 'returns true' do
      expect(user.completed_lesson?(first_lesson_completion)).to eql(true)
    end

    context 'when the passed in lesson hasnt been completed' do

      it 'returns false' do
        expect(user.completed_lesson?(second_lesson_completion)).to eql(false)
      end
    end
  end

  describe '#latest_completed_lesson' do
    it 'returns the latest completed lesson' do
      expect(user.latest_completed_lesson).to eql(second_lesson_completion)
    end

    context 'when the user does not have any completed lessons' do
      let(:lesson_completions) { [] }

      it 'returns nil' do
        expect(user.latest_completed_lesson).to eql(nil)
      end
    end
  end

  describe '#latest_completion_time' do
    let(:lesson) { double('Lesson', id: 1) }

    before do
      allow(lesson_completions).to receive(:find_by).with(lesson_id: 1).
        and_return(first_lesson_completion)
    end

    it 'returns the time of the latest completed lesson' do
      expect(user.lesson_completion_time(lesson)).
        to eql(DateTime.new(2016,11,11))
    end
  end

  describe '#last_lesson_completed' do
    it 'returns the latest completed lesson for the user' do
      expect(user.last_lesson_completed).to eql(second_lesson_completion)
    end
  end

  describe '.from_omniauth' do
    let(:user) {
      FactoryGirl.create(
        :user,
        username: 'kevin',
        email: 'kevin@email.com',
        provider: 'github',
        uid: '123',
      )
    }
    let(:user_details) {
      {
        provider: 'github',
        uid: '123',
        username: 'kevin',
        email: 'kevin@example.com',
      }
    }
    let(:auth) {
      {
        provider: 'github',
        uid: '123',
        :info => {
          name: 'kevin',
          email: 'kevin@example.com',
        }
      }
    }

    before do
      allow(user).to receive(:where).
        with({provider: 'github', uid: '123' }).
        and_return(user)

      allow(user).to receive(:first_or_create).
        with(user_details).and_return(user)
    end

    it 'returns the user' do
      expect(User.from_omniauth(auth)).to eql(user)
    end
  end

  describe '#add_omniauth' do
    let(:user) { FactoryGirl.create(:user) }
    let(:auth) { { 'provider' => 'github', 'uid' => '123' } }

    it 'returns the user' do
      expect(user.add_omniauth(auth)).to eql(user)
    end

    it 'saves the omniauth provider attributte' do
      user.add_omniauth(auth)
      expect(user.provider).to eql('github')
    end
  end

  describe '#password_required' do

    it 'returns true' do
      expect(user.password_required?).to eql(true)
    end

    context 'when the provider is not blank' do
      let(:provider) { 'github' }

      it 'returns false' do
        expect(user.password_required?).to eql(false)
      end
    end
  end

  describe '#send_confirmation_instructions' do
    let(:confirmation_token) { 'foo' }

    before do
      user.instance_variable_set(:@raw_confirmation_token, confirmation_token)
      allow(user).to receive(:generate_confirmation_token!).
        and_return(confirmation_token)
      allow(user).to receive(:send_welcome_email).with(confirmation_token)
    end

    it 'does not generate a new confirmation token' do
      user.send_confirmation_instructions
      expect(user).not_to receive(:generate_confirmation_token!)
    end

    it 'sends the welcome email' do
      expect(user).to receive(:send_welcome_email).with('foo')
      user.send_confirmation_instructions
    end

    context 'when raw confimration token is nil' do
      let(:confirmation_token) { nil }

      it 'does generate a new confirmation token' do
        expect(user).to receive(:generate_confirmation_token!)
        user.send_confirmation_instructions
      end
    end
  end
end
