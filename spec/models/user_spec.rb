require 'rails_helper'

RSpec.describe User do
  subject(:user) {
    User.new(
      :username => "foobar",
      :email => "foo@bar.com",
      :password => "foobar",
      :legal_agreement => "true" )
    }

  it { is_expected.to validate_uniqueness_of(:username) }
  it { is_expected.to validate_presence_of(:legal_agreement).
      with_message("Don't forget the legal stuff!") }
  it { is_expected.to validate_length_of(:username) }
  it { is_expected.to have_many(:lesson_completions) }
  it { is_expected.to have_many(:completed_lessons) }

  describe '.by_latest_completion' do

  end

  describe '#completed_lesson?' do

  end

  describe '#latest_completed_lesson' do

  end
end
