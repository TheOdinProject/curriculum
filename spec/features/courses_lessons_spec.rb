require 'spec_helper'

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
      2.times{FactoryGirl.create(:lesson, :section_id => section.id)}
      2.times{FactoryGirl.create(:lesson, :section_id => section.id, :is_project => true)}
    end
  end

  context "on the courses page" do

    before do
      visit courses_path
    end

    it { should have_selector("h1", :text => "This is Your Path to Learning Web Development") }

    describe "it should include every course" do

      it "by title" do
        Course.all.each do |course|
          subject.should have_selector("h2", :text => course.title)
        end
      end
      # make it a controller test for the orderings
    end
    context "for inactive courses" do
      it "should say 'coming soon'" do
        course = Course.where(:is_active => false).first
        subject.should have_selector("h2", :text => "#{course.title} ...Coming Soon!")
      end
    end
    context "for regular lessons" do
      it "should not say Coming Soon" do
        course = Course.where(:is_active => true).first
        subject.should_not have_selector("h2", :text => "#{course.title} ...Coming Soon!")
      end
    end

    context "user has completed all lessons in a course" do
      let!(:student) { FactoryGirl.create(:user) }

      before do
        sign_in(student)
      end

      it "shows green checkmark by completed course" do
        # Mark all lessons in the first course as complete
        Course.first.lessons.each do |l|
          LessonCompletion.create(:lesson_id => l.id, :student_id => student.id)
        end
        # Check courses index to ensure course has a green check mark by it
        within(:link_to, lessons_path(Course.first.title_url), text: "#{Course.first.title}") do
          subject.should have_selector("h3", text: "✔")
        end
      end

      it "does not show green checkmark by incomplete courses", js: true do
        # Visit course page and ensure that there is at least one incomplete lesson
        visit lessons_path(Course.first.title_url)
        if page.has_selector?("a.lc-checkbox lc-checked")
          click_on("a.lc-checkbox lc-checked", match: :first)
        end
        # Return to courses index page; course should not have green check mark
        visit courses_path
        within(:link_to, lessons_path(Course.first.title_url), text: "#{Course.first.title}") do
          subject.should_not have_selector("h3", text: "✔")
        end
      end
    end

  end

  context "on the lessons index page" do

    let(:course1) { Course.first }
    let(:lesson1) { course1.lessons.first }

    before do
      visit course_path(course1.title_url)
    end

    it "should include every lesson for that course" do
      course1.lessons.each do |lesson|
        subject.should have_selector("h3", :text => lesson.title)
      end
    end

    it "should not include lessons for any other course" do
      not_included_lesson = Course.where("id != #{course1.id}").first.lessons.first
      # puts not_included_lesson.inspect
      subject.should_not have_selector("h3", :text => not_included_lesson.title)
    end

    it "should include all sections for that course" do
      course1.sections.each do |section|
        subject.should have_selector("h2", :text => section.title)
      end
    end

    it "should not include all sections for another course" do
      not_included_section = Course.where("id != #{course1.id}").first.sections.first
      # puts not_included_section.inspect
      subject.should_not have_selector("h3", :text => not_included_section.title)
    end

    context "for projects" do

      let(:project1) { course1.lessons.where(:is_project => :true).first }

      it "should have a special project class" do
        project1.title.should_not be_blank
        url = lesson_path(course1.title_url, project1.title_url)
        selector = ".lesson.project a[href=\'#{url}\']"
        expect(subject).to have_css(selector)
      end
    end

    context "for regular lessons" do

      let(:non_project1) { course1.lessons.where(:is_project => :false).first }

      it "should not have a special project class" do
        non_project1.title.should_not be_blank
        url = lesson_path(course1.title_url, non_project1.title_url)
        xpath = "//a[@href=\'#{url}\']//*[@class='lesson project']"
        subject.should_not have_xpath(xpath)
      end
    end

    it "should NOT have a checkbox for the lesson" do
      expect(page).to_not have_css("#lc-id-#{course1.lessons.first.id}")
    end

    it "should NOT have a percent-completed indicator" do
      expect(page).to_not have_css(".lc-percent-completion")
    end

    context "for a signed-in user" do

      let!(:signed_in_student){ FactoryGirl.create(:user) }

      before do
        sign_in(signed_in_student)
        visit course_path(course1.title_url)
      end


      describe "lesson completions" do

        it "should have a percent-completed indicator" do
          expect(page).to have_css(".lc-percent-completion")
        end

        it "should have a checkbox for the lesson" do

          expect(page).to have_css("#lc-id-#{lesson1.id}")

        end

        context "when user has not already completed the lesson" do

          it "the lesson's checkbox should appear unchecked" do
            expect(page).to have_css("#lc-id-#{lesson1.id} .lc-unchecked")
          end

          describe "the percent completion indicator" do
            it "should register 0%" do
              within(".lc-percent-completion") do
                expect(page).to have_text("0%")
              end
            end
          end

          context "after clicking the checkbox" do

            # After the AJAX successfully returns, it should re-render just the checkbox area to reflect
            # the completed checkbox
            it "should change the checkbox to checked (JS test)", :js => true do
              find("#lc-id-#{lesson1.id}  a.lc-checkbox").click
              expect(page).to have_css("#lc-id-#{lesson1.id} .lc-checked")
            end

          end

          context "when there are two previously unchecked lessons on the page" do

            let(:lesson2) { course1.lessons[1] }

            it "clicking one does not result in both being checked (JS test)", :js => true do
              find("#lc-id-#{lesson1.id} a.lc-checkbox").click
              expect(page).to have_css("#lc-id-#{lesson1.id} .lc-checked")
              expect(page).to_not have_css("#lc-id-#{lesson2.id} .lc-checked")
            end

          end

        end

        context "and user HAS already completed the lesson" do

          before do
            @lc = LessonCompletion.create(:lesson_id => lesson1.id, :student_id => signed_in_student.id)
            visit course_path(course1.title_url)
          end

          it "should show a checked box for that lesson" do
            expect(page).to have_css("#lc-id-#{lesson1.id} .lc-checked")
          end

          context "after clicking that pre-checked box" do

            it "should change the checkbox to its unchecked state (JS test)", :js => true do
              within("#lc-id-#{lesson1.id}") do
                find("a.lc-checkbox").click
                expect(page).to have_css(".lc-unchecked")
                expect(page).to_not have_css(".lc-checked")
              end
            end

          end

        end

        context "when the user has completed ALL lessons" do
          before do
            Lesson.all.each do |l|
              LessonCompletion.create(:lesson_id => l.id, :student_id => signed_in_student.id)
            end
            visit course_path(course1.title_url)
          end

          it "should show a checked box for that lesson" do
            within(".lc-percent-completion") do
              expect(page).to have_css(".lc-finished")
            end
          end
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

    it "should show the lesson name in the title" do
      expect(page.title).to have_content(lesson1.title)
    end

    it "should show something in the lesson body container" do
      subject.find(:xpath,"//*[@class='individual-lesson ']//*[@class='container']").text.should_not be_empty
    end

    it "should show social sharing buttons" do
      subject.should have_selector('div.social_sharing_buttons')
    end

    it "should have contributions links div" do
      subject.should have_selector(".contribution-links")
    end

    it "should have Octocat image" do
      subject.should have_css('img', "octocat.png")
    end

    context "clicking the Github Octocat image at the end of the lesson" do
      before do
        find('.contribution-links').click
      end

      it "should display the contributing modal", :js => true do
        expect(page).to have_css(".popover")
      end
    end

    context "for projects" do
      before do
        visit lesson_path(course1.title_url, project1.title_url)
      end

      it "should have a special project class" do
        xpath = "//*[@class='individual-lesson project-lesson']"
        subject.should have_xpath(xpath)
      end
    end

    context "for regular lessons" do
      before do
        visit lesson_path(course1.title_url, non_project1.title_url)
      end

      it "should not have a special project class" do
        xpath = "//*[@class='individual-lesson project-lesson']"
        subject.should_not have_xpath(xpath)
      end
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
        # Make sure our test properly populated things...
        it "should be a valid section size" do
          second_section.lessons.count.should >= 4
        end

        it "should have a backlink to the lessons list" do
          subject.should have_xpath("//*[@href = \'#{lessons_path(course1.title_url)}\']")
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

        context "for logged-in students" do
          let!(:signed_in_student){ FactoryGirl.create(:user) }

          before do
            sign_in(signed_in_student)
            visit lesson_path(course1.title_url, lesson1.title_url)
          end

          it "should be present" do
            expect(page).to have_css("#lc-progress-bar")
          end

          it "should have a link to the second lesson in the course" do
            within("#lc-progress-bar") do
                expect(page).to have_link("", :href => lesson_path(course1.title_url, lesson2.title_url, :ref => "lc-pb"))
            end
          end

          it "should have links to every lesson in the course except the current one" do
            course1.lessons.each do |l|
              next if l == lesson1
              within("#lc-progress-bar") do
                expect(page).to have_link("", :href => lesson_path(course1.title_url, lesson2.title_url, :ref => "lc-pb"))
              end
            end
          end

          it "should have a current lesson circle" do
            expect(page).to have_css(".lc-active-circle")
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
            subject.should have_xpath("//*[@href = \'#{lesson_path(second_sec_lesson.course.title_url, second_sec_lesson.title_url, :ref => "lnav")}\']")
          end
        end

        context "at the end of a section" do
          before do
            visit lesson_path(last_sec_lesson.course.title_url, last_sec_lesson.title_url)
          end
          it "should show a next button to next section's first lesson" do
            subject.should have_xpath("//*[@href = \'#{lesson_path(next_sec_first_lesson.course.title_url, next_sec_first_lesson.title_url, :ref => "lnav")}\']")
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
                expect(page).to have_css(".lc-completion-indicator.hidden")
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
