require 'rails_helper'

RSpec.describe UserDecorator do
  subject(:user_decorator) { UserDecorator.new(user) }

  let(:user) {
    double(
      'User',
      twitter: user_twitter,
      facebook: user_facebook,
      linkedin: user_linkedin,
      github: user_github
    )
  }
  let(:user_twitter) { 'odinstudent' }
  let(:user_facebook) { 'odinstudent' }
  let(:user_linkedin) { 'odinstudent' }
  let(:user_github) { 'odinstudent' }

  describe '#twitter_url' do
    it 'returns the users twitter url' do
      expect(user_decorator.twitter_url)
        .to eql('http://www.twitter.com/odinstudent')
    end

    context 'when the twitter handle starts with @' do
      let(:user_twitter) { '@odinstudent' }

      it 'returns the twitter url correctly formatted' do
        expect(user_decorator.twitter_url)
          .to eql('http://www.twitter.com/odinstudent')
      end
    end

    context 'when the user does not have a twitter username' do
      let(:user_twitter) { nil }

      it 'returns nil' do
        expect(user_decorator.twitter_url).to eql(nil)
      end
    end
  end

  describe '#facebook_url' do
    it 'returns the users formatted facebook url' do
      expect(user_decorator.facebook_url)
        .to eql('https://www.facebook.com/odinstudent')
    end

    context 'when user does not have a facebook username' do
      let(:user_facebook) { nil }

      it 'returns nil' do
        expect(user_decorator.facebook_url).to eql(nil)
      end
    end
  end

  describe '#linkedin_url' do
    it 'returns the users formatted linkedin url' do
      expect(user_decorator.linkedin_url)
        .to eql('https://www.linkedin.com/in/odinstudent')
    end

    context 'when user does not have a linkedin username' do
      let(:user_linkedin) { nil }

      it 'returns nil' do
        expect(user_decorator.linkedin).to eql(nil)
      end
    end
  end

  describe '#github_url' do
    it 'returns the users github url' do
      expect(user_decorator.github_url)
        .to eql('http://www.github.com/odinstudent')
    end

    context 'when the github username starts with http' do
      let(:user_github) { 'http://www.github.com/odinstudent' }

      it 'returns the twitter url correctly formatted' do
        expect(user_decorator.github_url)
          .to eql('http://www.github.com/odinstudent')
      end
    end

    context 'when the user does not have a github username' do
      let(:user_github) { nil }

      it 'returns nil' do
        expect(user_decorator.github_url).to eql(nil)
      end
    end
  end
end
