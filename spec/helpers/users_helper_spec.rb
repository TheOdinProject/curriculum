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
end
