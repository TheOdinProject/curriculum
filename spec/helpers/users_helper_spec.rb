require 'rails_helper'

describe UsersHelper do
  let(:user) { double('User', lesson_completion_time: lesson_completion_time) }
  let(:lesson_completion_time) { DateTime.new(2016, 10, 11, 19) }
  let(:social_media_link) { double(:social_media_link) }

  before do
    allow(SocialMediaLink).to receive(:new).with(user).
      and_return(social_media_link)

    allow(social_media_link).to receive(:twitter_url)
    allow(social_media_link).to receive(:facebook_url)
    allow(social_media_link).to receive(:linkedin_url)
    allow(social_media_link).to receive(:github_url)
  end

  describe '#gravatar_url' do
    let(:gravatar_url) { double('GravatarUrl') }
    let(:size) { 4 }

    before do
      allow(GravatarUrlBuilder).to receive(:new).with(user, size).
        and_return(gravatar_url)

      allow(gravatar_url).to receive(:url)
    end

    it 'builds a gravatar url' do
      helper.gravatar_url(user, size)

      expect(gravatar_url).to have_received(:url)
    end
  end

  describe '#twitter_url' do

    it 'returns the users twiter url' do
      helper.twitter_url(user)

      expect(social_media_link).to have_received(:twitter_url)
    end
  end

  describe '#github' do

    it 'returns the users github url' do
      helper.github_url(user)

      expect(social_media_link).to have_received(:github_url)
    end
  end

  describe '#twitter_url' do

    it 'returns the users facebook url' do
      helper.facebook_url(user)

      expect(social_media_link).to have_received(:facebook_url)
    end
  end

  describe '#linkedin_url' do

    it 'returns the users linkedin url' do
      helper.linkedin_url(user)

      expect(social_media_link).to have_received(:linkedin_url)
    end
  end

  describe '#lesson_time' do
    let(:lesson) { double('Lesson') }

    it 'returns formatted lesson completion time' do
      expect(helper.lesson_time(user, lesson)).
        to eql('October 11, 2016 19:00')
    end
  end
end
