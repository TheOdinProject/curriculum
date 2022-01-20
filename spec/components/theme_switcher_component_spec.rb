require 'rails_helper'

RSpec.describe ThemeSwitcherComponent, type: :component do
  context 'when dark mode is enabled' do
    it 'renders the light mode button' do
      component = described_class.new(theme: 'dark')

      render_inline(component)

      expect(rendered_component).to have_link(href: '/themes?theme=light')
    end
  end

  context 'when dark mode is not enabled' do
    it 'renders the dark mode button' do
      component = described_class.new(theme: 'light')

      render_inline(component)

      expect(rendered_component).to have_link(href: '/themes?theme=dark')
    end
  end
end
