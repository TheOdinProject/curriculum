require 'rails_helper'

RSpec.describe UsersHelper do
  let(:user) { double('User', lesson_completion_time: lesson_completion_time) }
  let(:lesson_completion_time) { DateTime.new(2016, 10, 11, 19) }

  describe '#gravatar_url' do
    let(:gravatar_url) { double('GravatarUrl') }
    let(:size) { 4 }

    before do
      allow(GravatarUrlBuilder).to receive(:new).with(user, size)
        .and_return(gravatar_url)

      allow(gravatar_url).to receive(:url)
    end

    it 'builds a gravatar url' do
      helper.gravatar_url(user, size)
      expect(gravatar_url).to have_received(:url)
    end
  end

  describe '#lesson_time' do
    let(:lesson) { double('Lesson') }

    it 'returns formatted lesson completion time' do
      expect(helper.lesson_time(user, lesson)).to eql('October 11, 2016 19:00')
    end
  end

  describe '#set_learning_goal' do
    let(:settings_link) {
      "Set a learning goal in your <a href=\"/users/edit\">settings</a>."
    }

    it 'returns a link to the users settings page' do
      expect(helper.set_learning_goal).to eql(settings_link)
    end
  end

  describe '#avatar_path' do
    let(:avatar) { 'http://www.github.com/image' }

    it 'returns the users image path' do
      expect(avatar_path(avatar)).to eq(avatar)
    end

    context 'when the user doesnt have a avatar' do
      let(:avatar) { nil }

      it 'returns the default Odin avatar' do
        expect(avatar_path(avatar)).to eql('/images/odin-logo.svg')
      end
    end
  end
end
