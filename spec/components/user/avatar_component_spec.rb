require 'rails_helper'

RSpec.describe User::AvatarComponent, type: :component do
  context 'when the user has an avatar' do
    it 'renders the users avatar' do
      user = create(:user, avatar: 'avatar.png')
      component = described_class.new(current_user: user, size_classes: 'w-12')

      render_inline(component)

      expect(rendered_component).to have_css("img[src*='avatar.png']")
    end
  end

  context 'when the user does not have an avatar' do
    it 'renders the blank avatar' do
      user = create(:user, avatar: nil)
      component = described_class.new(current_user: user, size_classes: 'w-12')

      render_inline(component)

      expect(rendered_component).to have_content('default user avatar')
    end
  end
end
