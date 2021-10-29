require 'rails_helper'

RSpec.describe ProgressBadgeComponent, type: :component do
  let(:course) { create(:course) }
  let!(:section) { create(:section, course: course) }
  let!(:lesson) { create(:lesson, section: section) }
  let(:user) { create(:user) }

  context 'when the user is logged in and has started the course' do
    it 'renders a progress circle around the badge' do
      component = described_class.new(
        course: course,
        current_user: user,
        url: "/courses/progress/#{course.id}",
      )

      sign_in(user)
      create(:lesson_completion, user: user, lesson: lesson, course: course)
      render_inline(component)

      expect(rendered_component).to have_css('.progress-circle')
    end
  end

  context 'when the user is logged in but has not started the course' do
    it 'renders the badge without a progress circle' do
      component = described_class.new(
        course: course,
        current_user: user,
        url: "/courses/progress/#{course.id}",
      )

      sign_in(user)
      render_inline(component)

      expect(rendered_component).to have_no_css('.progress-circle')
    end
  end

  context 'when the user is not logged in' do
    it 'renders the badge without a progress circle' do
      component = described_class.new(
        course: course,
        current_user: user,
        url: "/courses/progress/#{course.id}",
      )

      create(:lesson_completion, user: user, lesson: lesson, course: course)
      render_inline(component)

      expect(rendered_component).to have_no_css('.progress-circle')
    end
  end
end
