require 'rails_helper'

RSpec.describe UsersHelper do
  describe '#display_dashboard_learning_goal' do
    let(:user) { build_stubbed(:user, learning_goal: learning_goal) }
    let(:learning_goal) { 'To be the best' }

    it 'returns the users learning goal' do
      expect(helper.display_dashboard_learning_goal(user)).to eql('To be the best')
    end

    context 'when the user does not have a learning goal' do
      let(:learning_goal) { '' }

      it 'returns a link to the users settings page' do
        expect(helper.display_dashboard_learning_goal(user)).to eql(
          'Set a learning goal in your <a class="profile-card__link" href="/users/edit">settings</a>.'
        )
      end
    end
  end

  describe '#display_learning_goal' do
    let(:user) { build_stubbed(:user, learning_goal: learning_goal) }
    let(:learning_goal) { 'To be the best' }

    it 'returns the users learning goal' do
      expect(display_learning_goal(user)).to eql('To be the best')
    end

    context 'when the user does not have a learning goal set' do
      let(:learning_goal) { '' }

      it 'returns default text' do
        expect(display_learning_goal(user)).to eql('No learning goal set yet.')
      end
    end
  end

  describe '#avatar_path' do
    let(:user) { build_stubbed(:user, avatar: learning_goal) }
    let(:avatar) { 'http://www.github.com/image' }

    it 'returns the users image path' do
      expect(avatar_path(avatar)).to eq(avatar)
    end

    context 'when the user does not have a avatar' do
      let(:avatar) { nil }

      it 'returns the default Odin avatar' do
        expect(avatar_path(avatar)).to eql('/images/odin-logo.svg')
      end
    end
  end
end
