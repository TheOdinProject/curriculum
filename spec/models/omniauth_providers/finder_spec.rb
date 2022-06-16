require 'rails_helper'

module OmniauthProviders
  RSpec.describe Finder do
    subject(:finder) { described_class.new(auth) }

    let(:auth) do
      OmniAuth::AuthHash.new(
        provider: 'github',
        uid: '123',
        info: {
          email: 'john@odin.com',
          name: 'John',
          image: 'http://github.com/fake-avatar'
        }
      )
    end

    let(:user_provider) { instance_double(UserProvider) }

    before do
      allow(UserProvider).to receive(:find_by)
        .with(provider: 'github', uid: '123')
        .and_return(user_provider)
    end

    describe '#find' do
      it 'returns the user provider' do
        expect(finder.find).to eql(user_provider)
      end

      context 'when a user provider cannot be found' do
        let(:user_provider) { nil }
        let(:user) { class_double(User) }
        let(:new_user_provider) { instance_double(UserProvider) }
        let(:builder) { instance_double(OmniauthProviders::Builder, build: new_user_provider) }

        before do
          allow(Builder).to receive(:new)
            .with(auth, user)
            .and_return(builder)

          allow(User).to receive(:where)
            .with(email: 'john@odin.com')
            .and_return(user)

          allow(user).to receive(:first_or_create!).and_return(user)
        end

        it 'returns a new user provider' do
          expect(finder.find).to eql(new_user_provider)
        end
      end
    end
  end
end
