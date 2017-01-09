require 'rails_helper'

RSpec.describe LinkOmniauth, type: :service do
  subject(:link_omniauth) { LinkOmniauth.new(user, auth) }

  let(:user) { double('User') }
  let(:auth) { { provider: 'github', uid: '123' } }
  let(:added_omniauth?) { true }

  before do
    allow(user).to receive(:add_omniauth).with(auth)
      .and_return(added_omniauth?)
  end

  describe '#create' do
    let(:success_attributes) {
      {
        user: user,
        flash_type: :notice,
        flash_message: 'Successfully linked Github to your account'
      }
    }

    it 'returns successful link omniauth attributes' do
      expect(link_omniauth.create).to eql(success_attributes)
    end

    context 'when it cannot link omniauth to user' do
      let(:added_omniauth?) { false }
      let(:failure_attributes) {
        {
          user: user,
          flash_type: :error,
          flash_message: "We couldn't link Github to your account"
        }
      }

      it 'returns failed link omniauth attributes' do
        expect(link_omniauth.create).to eql(failure_attributes)
      end
    end
  end
end
