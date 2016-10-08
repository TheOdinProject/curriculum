require 'rails_helper'

# This spec combines both the courses and the lessons into one since they're so tightly intertwined
# Particularly because you need to create a course to create a section to create a lesson
# At some point we should probably refactor this out into separate specs and build a factory script
# that, if you want to create a Lesson, will automatically create a Section and Course for you.

describe "Courses and Lessons Pages" do

  subject {page}

  before do
    courses = FactoryGirl.create_list(:course, 3, :is_active => true)
    courses += FactoryGirl.create_list(:course, 4, :is_active => false)
    sections = []
    courses.each do |course|
      5.times do
        sections << FactoryGirl.create(:section, :course_id => course.id)
      end
    end
    sections.each do |section|
      2.times{
        FactoryGirl.create(
          :lesson,
          :section_id => section.id,
        )
      }
      2.times{
        FactoryGirl.create(
          :lesson,
          :section_id => section.id,
          :is_project => true)}
    end
  end

  context "on the courses page" do

    before do
      visit courses_path
    end

    describe "it should include every course" do

      it "by title" do
        Course.all.each do |course|
          expect(subject).to have_selector("h2", :text => course.title)
        end
      end
    end

    context "user has completed all lessons in a course" do
      let!(:student) { FactoryGirl.create(:user) }

      before do
        sign_in(student)
      end

      it "shows green checkmark by completed course" do
        Course.first.lessons.each do |l|
          LessonCompletion.create(:lesson_id => l.id, :student_id => student.id)
        end

        within(:link_to, lessons_path(Course.first.title_url), text: "#{Course.first.title}") do
          expect(subject).to have_selector("h3", text: "✔")
        end
      end

      it "does not show green checkmark by incomplete courses", js: true do
        visit lessons_path(Course.first.title_url)
        if page.has_selector?("a.lc-checkbox lc-checked")
          click_on("a.lc-checkbox lc-checked", match: :first)
        end

        visit courses_path
        within(:link_to, lessons_path(Course.first.title_url), text: "#{Course.first.title}") do
          expect(subject).not_to have_selector("h3", text: "✔")
        end
      end
    end
  end

  context "in the individual lesson page" do

    let!(:course1) { Course.first }
    let!(:lesson1) { course1.lessons.where(:is_project => false).first }
    let!(:project1) { course1.lessons.where(:is_project => :true).first }
    let!(:non_project1) { course1.lessons.where(:is_project => :false).first }

    before do
      visit lesson_path(course1.title_url, lesson1.title_url)
    end


    describe "navigation buttons and links" do

      # use the second section so we don't overlap with the
      # whole curriculum tests
      let(:second_section) { Section.all[1] }
      let(:first_sec_lesson){ second_section.lessons.order("position asc").first }
      let(:second_sec_lesson){ second_section.lessons.order("position asc")[1] }
      let(:last_sec_lesson){ second_section.lessons.order("position asc").last }
      let(:next_last_sec_lesson){ second_section.lessons.order("position asc")[-1] }
      let(:next_sec_first_lesson) { Section.all[2].lessons.order("position asc").first}

      # very first lesson of a course
      let(:first_lesson){ Lesson.order("position asc").first }
      # very last lesson of a course
      let(:last_lesson){ first_lesson.course.lessons.order("position asc").last }

      describe "set up our test properly" do

        it "should have a backlink to the lessons list" do
          expect(subject).to have_xpath("//*[@href = \'#{lessons_path(course1.title_url)}\']")
        end
      end

      describe "in the top breadcrumb area" do
        it "should have backlinks to the courses directory" do
          within "#lesson-nav" do
            expect(page).to have_link("", :href => courses_path)
          end
        end
        it "should have backlinks to the lessons index (aka course page)" do
          within "#lesson-nav" do
            expect(page).to have_link("", :href => lessons_path(lesson1.course.title_url, :anchor => "section-#{lesson1.section.title_url}"))
          end
        end
      end

      describe "the top progress-tracking bar" do

        # since we will need to test for its presence
        let(:lesson2) { course1.lessons[1] }

        context "for not logged-in visitors" do
          it "should NOT be present" do
            expect(page).to_not have_css("#lc-progress-bar")
          end
        end
      end

      describe "in the end-of-lesson area" do

        # Note: this isn't really testing anything new...
        context "in the middle of a section" do
          before do
            visit lesson_path(first_sec_lesson.course.title_url, first_sec_lesson.title_url)
          end
          it "should show a next button for the next lesson" do
            expect(subject).to have_xpath("//*[@href = \'#{lesson_path(second_sec_lesson.course.title_url, second_sec_lesson.title_url, :ref => "lnav")}\']")
          end
        end

        context "at the end of a section" do
          before do
            visit lesson_path(last_sec_lesson.course.title_url, last_sec_lesson.title_url)
          end
          it "should show a next button to next section's first lesson" do
            expect(subject).to have_xpath("//*[@href = \'#{lesson_path(next_sec_first_lesson.course.title_url, next_sec_first_lesson.title_url, :ref => "lnav")}\']")
          end
        end

        context "at the beginning of a course" do
          before do
            visit lesson_path(first_lesson.course.title_url, first_lesson.title_url)
          end
          it "should disable the previous button" do
            expect(page).to have_css(".lnav-prev.lnav-disabled")
          end
        end

        context "at the end of a course" do
          before do
            visit lesson_path(last_lesson.course.title_url, last_lesson.title_url)
          end

          it "should include the 'view course' button" do
            expect(page).to have_css(".lnav-index")
          end

          it "should disable the 'next course' button" do
            expect(page).to have_css(".lnav-next.lnav-disabled")
          end
        end
      end
    end

    describe "End-of-lesson checkbox section" do
      it "should be there" do
        expect(page).to have_css(".lc-end-wrapper")
      end
    end

    describe "Completed text" do
      it "should not be present since user isn't signed in" do
        expect(page).to_not have_css(".lc-completion-indicator")
      end
    end

    context "for logged in students" do

      let!(:signed_in_student){ FactoryGirl.create(:user) }

      before do
        sign_in(signed_in_student)
      end

      context "after visiting the first individual lesson" do

        before do
          visit lesson_path(course1.title_url, lesson1.title_url)
        end

        describe "Top-of-lesson success section" do
          context "if user hasn't yet completed the lesson" do
            # (default state)
            it "should hide text indicating it was completed" do
              expect(page).to have_css(".lc-completion-indicator.hidden")
            end
          end

          context "if user HAS completed the lesson" do
            before do
              @lc = LessonCompletion.create(:lesson_id => lesson1.id, :student_id => signed_in_student.id)
              visit lesson_path(course1.title_url, lesson1.title_url)
            end

            it "should have text indicating it was completed" do
              expect(page).to have_css(".lc-completion-indicator")
            end
            it "should not hide text indicating it was completed" do
              expect(page).to_not have_css(".lc-completion-indicator.hidden")
            end
          end

        end

        describe "End-of-lesson checkbox section" do

          let!(:completion_wrapper_div){ ".lc-end-wrapper" }

          it "shouldn't have a link to sign in" do
            within(completion_wrapper_div) do
              expect(page).to_not have_link("", :href => login_path)
            end
          end

          context "if user hasn't yet completed the lesson" do
            # (default state)

            it "should have text for marking lesson completed" do
              within(completion_wrapper_div) do
                expect(page).to have_text("Mark Lesson Completed")
              end
            end
            it "should have a link (the checkbox) to mark a lesson completed" do
              within(completion_wrapper_div) do
                expect(page).to have_css("a.lc-unchecked")
              end
            end

            context "after clicking the complete lesson box" do

              # After the AJAX returns, it should re-render just the checkbox area to reflect
              # the completed checkbox and add a link to un-complete the lesson
              it "should change the form's class to reflect completion (JS test)", :js => true do
                find("a.lc-unchecked").click
                expect(page).to have_css("a.lc-uncomplete-link")
              end

              it "should show the lesson completed check (JS test)", :js => true do
                find("a.lc-unchecked").click
                expect(page).to have_css(".lc-completion-indicator")
              end
              it "should not hide the lesson completed check (JS test)", :js => true do
                find("a.lc-unchecked").click
                wait_for_ajax
                expect(page).to_not have_css(".lc-completion-indicator.hidden")
              end
            end
          end

          context "if the user has already completed the lesson" do

            before do
              @lc = LessonCompletion.create(:lesson_id => lesson1.id, :student_id => signed_in_student.id)
              visit lesson_path(course1.title_url, lesson1.title_url)
            end

            it "should have a link for marking lesson NOT completed" do
              expect(page).to have_css(".lc-uncomplete-link")
            end

            context "after clicking the 'mark lesson not completed' link" do
              it "should change the form's class to reflect completion (JS test)", :js => true do
                find("a.lc-uncomplete-link").click
                expect(page).to have_css("a.lc-unchecked")
              end
              it "should hide the completion check (JS test)", :js => true do
                find("a.lc-uncomplete-link").click
                expect(page).to have_css(".lc-completion-indicator.hidden", :visible => false)
              end
            end
          end
        end

        describe "end-of-lesson navigation " do
          context "if the user has already completed the lesson" do
            before do
              @lc = LessonCompletion.create(:lesson_id => lesson1.id, :student_id => signed_in_student.id)
              visit lesson_path(course1.title_url, lesson1.title_url)
            end

            it "should highlight the next lesson" do
              expect(page).to have_css(".lnav-next .lnav-active")
            end
          end
        end
      end
    end

    context "for not logged in visitors" do

      describe "End-of-lesson checkbox section" do

        let!(:completion_wrapper_div){ ".lc-end-wrapper" }

        it "should contain a link to sign in" do
          within(completion_wrapper_div) do
            expect(page).to have_link("", :href => login_path)
          end
        end

        it "should have text for marking lesson completed" do
          within(completion_wrapper_div) do
            expect(page).to have_text("Mark Lesson Completed")
          end
        end

        it "should NOT have a link (the checkbox) to mark a lesson completed" do
          within(completion_wrapper_div) do
            expect(page).to_not have_css("a.action-complete-lesson")
          end
        end
      end

      describe "end-of-lesson navigation " do
        it "should not have any active lesson navs" do
          expect(page).not_to have_css(".lnav-active")
        end
      end
    end
  end
end
