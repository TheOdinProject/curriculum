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
      avatar: avatar
    )
  }
  let(:provider) { '' }
  let(:avatar) { 'http://github.com/fake-avatar' }

  let(:lesson_completions) {
    [first_lesson_completion, second_lesson_completion]
  }

  let(:first_lesson_completion) {
    double(
      'LessonCompletion',
      id: 1,
      student_id: 1,
      created_at: DateTime.new(2016, 11, 11),
      lesson_id: 1
    )
  }

  let(:second_lesson_completion) {
    double(
      'LessonCompletion',
      id: 2,
      student_id: 1,
      created_at: DateTime.new(2016, 11, 8),
      lesson_id: 2
    )
  }

  let(:completed_lessons) { [first_lesson_completion] }

  before do
    allow(user).to receive(:lesson_completions).and_return(lesson_completions)
    allow(user).to receive(:completed_lessons).and_return(completed_lessons)
    allow(Lesson).to receive(:find).with(2).and_return(second_lesson_completion)

    allow(lesson_completions).to receive(:order).with(created_at: :asc)
      .and_return(lesson_completions)
  end

  it { is_expected.to validate_uniqueness_of(:username) }

  it { is_expected.to validate_length_of(:username) }
  it { is_expected.to have_many(:lesson_completions) }
  it { is_expected.to have_many(:completed_lessons) }

  describe '#has_completed?' do
    let(:exists?) { true }

    before do
      allow(completed_lessons).to receive(:exists?).and_return(exists?)
    end

    it 'returns true' do
      expect(user.has_completed?(first_lesson_completion)).to eql(true)
    end

    context 'when the passed in lesson hasnt been completed' do
      let(:exists?) { false }

      it 'returns false' do
        expect(user.has_completed?(second_lesson_completion)).to eql(false)
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
      allow(lesson_completions).to receive(:find_by).with(lesson_id: 1)
        .and_return(first_lesson_completion)
    end

    it 'returns the time of the latest completed lesson' do
      expect(user.lesson_completion_time(lesson))
        .to eql(DateTime.new(2016, 11, 11))
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
        uid: '123'
      )
    }

    let(:user_details) {
      {
        provider: 'github',
        uid: '123',
        username: 'kevin',
        email: 'kevin@example.com'
      }
    }

    let(:auth) {
      double(
        'OmniAuth::AuthHash',
        provider: 'github',
        uid: '123',
        info: info
      )
    }

    let(:info) {
      double(
        'OmniAuth::AuthHash::InfoHash',
        name: 'kevin',
        email: 'kevin@example.com',
        image: 'http://github.com/fake-avatar'
      )
    }

    before do
      allow(user).to receive(:where)
        .with(provider: 'github', uid: '123')
        .and_return(user)

      allow(user).to receive(:first_or_create)
        .with(user_details)
        .and_return(user)
    end

    it 'returns the user' do
      expect(User.from_omniauth(auth)).to eql(user)
    end
  end

  describe '#update_avatar' do
    let(:github_avatar) { 'http://github.com/fake-avatar' }
    let(:avatar) { nil }

    it 'updates the users avatar' do
      user.update_avatar(github_avatar)
      expect(user.avatar).to eql('http://github.com/fake-avatar')
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
      allow(user).to receive(:generate_confirmation_token!)
        .and_return(confirmation_token)
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
