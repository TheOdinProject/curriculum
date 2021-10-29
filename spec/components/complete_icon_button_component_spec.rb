require 'rails_helper'

RSpec.describe CompleteIconButtonComponent, type: :component do
  let(:lesson) { create(:lesson) }
  let(:user) { create(:user) }

  it 'renders the icon button with the lesson complete state' do
    create(:lesson_completion, lesson: lesson, user: user)
    component = described_class.new(lesson: lesson, current_user: user)

    render_inline(component)

    expect(rendered_component).to have_css(
      ".complete-icon-button[data-complete-button-is-completed-value='true']"
    )
  end

  it 'renders the icon button with lesson incomplete state' do
    component = described_class.new(lesson: lesson, current_user: user)

    render_inline(component)

    expect(rendered_component).to have_css(
      ".complete-icon-button[data-complete-button-is-completed-value='false']"
    )
  end
end
