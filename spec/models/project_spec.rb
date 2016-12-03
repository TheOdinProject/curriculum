require 'rails_helper'

RSpec.describe Project, type: :model do
  subject {
    Project.new(
      repo_url: 'https://github.com/learner/repo',
      user_id: user.id,
      lesson_id: lesson.id
    )
  }
  let(:user) { double('User', id: 1) }
  let(:lesson) { double('Lesson', id: 1) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:lesson) }

  it do
    is_expected.to validate_presence_of(:repo_url)
      .with_message('must start with http://github.com/ or https://github.com/')
  end

  it do
    is_expected.to allow_values(
      'https://github.com/username/repo_name',
      'http://github.com/username/repo_name'
    ).for(:repo_url)
  end

  it do
    is_expected.not_to allow_values(
      'url',
      'www.github.com',
      'http://github.com',
      'https://github.com'
    ).for(:repo_url)
  end
end
