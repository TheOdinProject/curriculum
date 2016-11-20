require 'rails_helper'

RSpec.describe NewOrExistingOmniauthUser do
  subject(:new_or_existing_omniauth_user) {
    NewOrExistingOmniauthUser.new(auth)
  }

  let(:auth) { { provider: 'github', uid: '123' } }
  let(:user) { double('User', persisted?: user_persisted) }
  let(:user_persisted) { true }

  before do
    allow(User).to receive(:from_omniauth).with(auth).and_return(user)
  end

  describe '#create' do
    let(:existing_user_attributes) {
      {
        user: user,
        flash_type: :notice,
        flash_message: 'Thanks for logging in with Github!'
      }
    }

    it 'returns attributes for signing in existing omniauth user' do
      expect(new_or_existing_omniauth_user.create)
        .to eql(existing_user_attributes)
    end

    context 'when user does not exist in the database' do
      let(:user_persisted) { false }
      let(:new_user_attributes) {
        {
          user: user,
          flash_type: :none,
          flash_message: ''
        }
      }

      it 'returns new omniauth attributes' do
        expect(new_or_existing_omniauth_user.create).to eql(new_user_attributes)
      end
    end
  end
end
