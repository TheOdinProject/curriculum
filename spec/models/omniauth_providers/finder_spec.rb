require 'rails_helper'

module OmniauthProviders
  RSpec.describe Finder do
    subject { Finder.new(auth) }

    let(:auth) { double('Auth', info: info, uid: '123', provider: 'github') }
    let(:info) { double('Info', name: 'John', email: 'john@odin.com') }
    let(:user_provider) { double('UserProvider') }

    before do
      allow(UserProvider).to receive(:where).
        with(provider: 'github', uid: '123' ).
        and_return([user_provider])
    end

    describe '#find' do

      it 'returns the user provider' do
        expect(subject.find).to eql(user_provider)
      end

      context 'when a user provider cannot be found' do
        let(:user_provider) { nil }
        let(:user) { double('User') }
        let(:new_user_provider) { double('UserProvider') }
        let(:builder) { double('Builder', build: new_user_provider) }

        before do
          allow(Builder).to receive(:new).with(auth, user).
            and_return(builder)

          allow(User).to receive(:where).with(email: 'john@odin.com').
            and_return([user])
        end

        it 'returns a new user provider' do
          expect(subject.find).to eql(new_user_provider)
        end

        context 'when a user with the provider email cannot be found' do
          let(:user) { nil }
          let(:random_password) { 'password123' }
          let(:new_user) { double('User') }

          before do
            allow(Devise).to receive(:friendly_token).
              and_return(random_password)

            allow(User).to receive(:create!).with(
              username: 'John',
              email: 'john@odin.com',
              password: random_password
            ).and_return(new_user)

            allow(Builder).to receive(:new).with(auth, new_user).
              and_return(builder)
          end

          it 'creates a new user ' do
            expect(User).to receive(:create!).with(
              username: 'John',
              email: 'john@odin.com',
              password: random_password
            )

            subject.find
          end

          it 'builds a user provider for the new user' do
            expect(Builder).to receive(:new).with(auth, new_user).
              and_return(builder)

            subject.find
          end
        end
      end
    end
  end
end
