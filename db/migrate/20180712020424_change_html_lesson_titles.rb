class ChangeHtmlLessonTitles < ActiveRecord::Migration[5.0][5.0]
  def up
    change_course_title('HTML5 and CSS3', 'HTML and CSS')
    change_section_titles(section_titles)
    change_lesson_titles
  end

  def down
    change_course_title('HTML and CSS', 'HTML5 and CSS3')
    change_section_titles(section_titles.invert)
    change_lesson_titles
  end

  private

  def change_course_title(old_title, new_title)
    course = Course.find_by_title(old_title)

    update_attributes(title: new_title) if course
  end

  def change_section_titles(section_titles)
    sections = section_titles.keys.filter_map { |title| Section.find_by_title(title) }.compact

    sections.each do |section|
      new_title = section_titles.fetch(section.title)

      section.update_attributes(title: new_title)
    end
  end

  def change_lesson_titles
    lessons = lesson_titles.keys.filter_map { |title| Lesson.find_by_title(title) }.compact

    lessons.each do |lesson|
      new_title = lesson_titles.fetch(lesson.title)

      lesson.update_attributes(title: new_title)
    end
  end

  def lesson_titles
    {
      'HTML5 Basics' => 'HTML Basics',
      'CSS3 Basics' => 'CSS Basics',
    }
  end

  def section_titles
    {
      'CSS3' => 'CSS',
      'Advanced CSS3' => 'Advanced CSS',
    }
  end
end
