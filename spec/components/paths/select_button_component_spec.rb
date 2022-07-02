require 'rails_helper'

RSpec.describe Paths::SelectButtonComponent, type: :component do
  context 'when leaner is on the path' do
    it 'renders the resume button' do
      path = create(:path)
      current_user = create(:user, path:)
      component = described_class.new(current_user:, path:)

      render_inline(component)

      expect(page).to have_button('Resume')
    end
  end

  context 'when learner is not on the path' do
    it 'renders the select button' do
      path = create(:path)
      current_user = create(:user)
      component = described_class.new(current_user:, path:)

      render_inline(component)

      expect(page).to have_button('Select')
    end
  end
end
