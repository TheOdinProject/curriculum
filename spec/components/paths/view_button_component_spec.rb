require 'rails_helper'

RSpec.describe Paths::ViewButtonComponent, type: :component do
  context 'when learner is logged in' do
    it 'renders the view button' do
      path = create(:path)
      current_user = create(:user)
      component = described_class.new(current_user:, path:)

      render_inline(component)

      expect(page).to have_button('View')
    end
  end

  context 'when learner is not logged in' do
    it 'renders the explore button' do
      path = create(:path)
      component = described_class.new(current_user: nil, path:)

      render_inline(component)

      expect(page).to have_button('Explore')
    end
  end
end
