require 'rails_helper'

RSpec.describe Lessons::TitleLinkComponent, type: :component do
  context 'when the lesson is a project' do
    it 'returns the project title' do
      lesson = create(:lesson, is_project: true, title: 'HTML Basics')
      component = described_class.new(lesson: lesson, lesson_number: 1)

      render_inline(component)

      expect(rendered_component).to have_content('1. Project: HTML Basics')
    end
  end

  context 'when the lesson is not a project' do
    it 'returns the lesson title' do
      lesson = create(:lesson, is_project: false, title: 'HTML Basics')
      component = described_class.new(lesson: lesson, lesson_number: 1)

      render_inline(component)

      expect(rendered_component).to have_content('1. HTML Basics')
    end
  end
end
