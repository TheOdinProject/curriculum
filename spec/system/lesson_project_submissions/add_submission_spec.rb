require 'rails_helper'

RSpec.describe 'Add a Project Submission', type: :system do
  let(:lesson) { create(:lesson, :project) }

  context 'when a user is signed in' do
    let(:user) { create(:user) }
    let(:another_user) { create(:user) }

    before do
      sign_in(user)
      visit path_course_lesson_path(lesson.section.course.path, lesson.section.course, lesson)
    end

    it 'successfully adds a submission' do
      form = Pages::ProjectSubmissions::Form.new.open.fill_in.submit

      expect(page).to have_content('Thanks for Submitting Your Solution!')
      form.close

      within(:test_id, 'submissions-list') do
        expect(page).to have_content(user.username)
      end

      expect(page).to have_no_button('Add Solution')
    end

    context 'setting a submission as private' do
      it 'will display the submission for the submission owner but not for other users' do
        form = Pages::ProjectSubmissions::Form.new.open.fill_in

        form.make_private
        form.submit
        form.close

        within(:test_id, 'submissions-list') do
          expect(page).to have_content(user.username)
        end

        using_session('another_user') do
          sign_in(another_user)
          visit path_course_lesson_path(lesson.section.course.path, lesson.section.course, lesson)

          within(:test_id, 'submissions-list') do
            expect(page).not_to have_content(user.username)
          end
        end
      end
    end
  end

  context 'when a user is not signed in' do
    it 'they cannot add a project submission' do
      visit path_course_lesson_path(lesson.section.course.path, lesson.section.course, lesson)

      expect(page).not_to have_button('Add Solution')
    end
  end
end
