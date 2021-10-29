require 'rails_helper'

RSpec.describe NotificationComponent, type: :component do
  let(:notification) do
    create(:notification, id: 1, title: 'test title', message: 'test message')
  end

  before do
    render_inline(described_class.new(notification: notification))
  end

  it 'renders the component with a link to the notification\'s url' do
    expect(rendered_component).to have_selector "a[href='/notifications/1']"
  end

  it 'renders the component with the notification\'s title titleized' do
    expect(rendered_component).to have_text 'Test Title'
  end

  it 'renders the component with the notification\'s message' do
    expect(rendered_component).to have_text 'test message'
  end

  context 'when the notification is read' do
    let(:notification) { create(:notification, read_at: Time.zone.now) }

    it 'renders the read notification icon inside the component' do
      expect(rendered_component).to have_css 'svg.text-nav-link-read'
    end
  end

  context 'when the notification is unread' do
    let(:notification) { create(:notification, read_at: nil) }

    it 'renders the unread notification icon inside the component' do
      expect(rendered_component).to have_css 'svg.text-nav-link-unread'
    end
  end
end
