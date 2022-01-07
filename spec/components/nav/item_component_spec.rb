require 'rails_helper'

RSpec.describe Nav::ItemComponent, type: :component do
  context 'when mobile' do
    it 'renders mobile nav item' do
      component = described_class.new(
        path: '/home',
        text: 'Home',
        test_id: 'nav-home',
        icon_path: 'icons/home.svg',
        mobile: true
      )

      render_inline(component)

      expect(rendered_component).to have_link('Home', href: '/home')
      expect(rendered_component).to have_content('Home icon')
    end
  end

  context 'when not mobile' do
    it 'renders the desktop nav item' do
      component = described_class.new(
        path: '/home',
        text: 'Home',
        test_id: 'nav-home',
        icon_path: nil,
        mobile: false
      )

      render_inline(component)

      expect(rendered_component).to have_link('Home', href: '/home')
    end
  end
end
