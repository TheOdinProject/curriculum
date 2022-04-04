require 'rails_helper'

module OmniauthProviders
  RSpec.describe Builder do
    describe '#build' do
      subject(:builder) { described_class.new(auth, user) }

      let(:auth) { double('Auth', provider: 'github', uid: '123') }
      let(:user) { create(:user) }

      it 'creates a new user provider' do
        expect { builder.build }.to change { UserProvider.count }.by(1)
      end
    end
  end
end
