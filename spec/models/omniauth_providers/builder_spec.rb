require 'rails_helper'

module OmniauthProviders
  RSpec.describe Builder do
    describe '#build' do
      subject { Builder.new(auth, user).build }

      let(:auth) { double('Auth', provider: 'github', uid: '123') }
      let(:user) { double('User', id: 1) }
      let(:user_provider) { double('UserProvider') }

      before do
        allow(UserProvider).to receive(:create!).
          with({ provider: 'github', uid: '123', user_id: 1 }).
          and_return(user_provider)
      end

      it 'returns a new user provider' do
        expect(subject).to eql(user_provider)
      end
    end
  end
end
