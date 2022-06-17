require 'rails_helper'

RSpec.describe CardComponent, type: :component do
  let(:data_attributes) { { controller: 'navbar', navbar_target: 'menu_state' } }

  it 'renders a div with the data attributes parsed to be html valid' do
    component = described_class.new(data_attributes:)

    render_inline(component)

    expect(page).to have_css("div[data-controller='navbar'][data-navbar-target='menu-state']")
  end
end
