require 'rails_helper'

RSpec.describe ButtonHelper do
  before do
    allow(helper).to receive(:resource_name).and_return('user')
  end

  describe '#signup_button' do
    it 'returns a sign up button' do
      expect(helper.signup_button).to eq('<a class="button button--primary" href="/sign_up">Sign Up</a>')
    end
  end

  describe '#login_button' do
    it 'returns a login button' do
      expect(helper.login_button).to eq('<a class="button button--transparent" href="/users/sign_in">Login</a>')
    end
  end

  describe '#create_new_account_button' do
    it 'returns a create new account button' do
      expect(helper.create_new_account_button).to eq(
        '<a class="button button--transparent" href="/users/sign_up">Create new account</a>'
      )
    end
  end

  describe '#curriculum_button' do
    it 'returns the curriculum button' do
      expect(helper.curriculum_button).to eq('<a class="button button--primary" href="/paths">Curriculum</a>')
    end
  end

  describe '#contribute_button' do
    it 'returns a contribute button' do
      expect(helper.contribute_button).to eq('<a class="button button--primary" href="/contributing">Contribute</a>')
    end
  end

  describe '#chat_button' do
    let(:chat_button) do
      # rubocop:disable Layout/LineLength
      '<a class="button button--secondary" target="_blank" rel="noreferrer" href="https://discord.gg/fbFCkYabZB">Open Discord</a>'
      # rubocop:enable Layout/LineLength
    end

    it 'returns a chat button' do
      expect(helper.chat_button).to eq(chat_button)
    end
  end
end
