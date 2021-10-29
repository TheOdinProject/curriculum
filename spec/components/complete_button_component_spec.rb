require 'rails_helper'

RSpec.describe CompleteButtonComponent, type: :component do
  let(:lesson) { create(:lesson, id: 1002) }
  let(:user) { create(:user) }

  it 'renders the button with the lesson complete state' do
    create(:lesson_completion, lesson: lesson, user: user)
    component = described_class.new(lesson: lesson, current_user: user)

    render_inline(component)

    expect(rendered_component).to have_button('Lesson Completed')
  end

  it 'renders the button with lesson incomplete state' do
    component = described_class.new(lesson: lesson, current_user: user)

    render_inline(component)

    expect(rendered_component).to have_button('Mark Complete')
  end
end
