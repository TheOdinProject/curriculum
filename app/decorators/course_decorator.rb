class CourseDecorator < ApplicationDecorator

  def badge
    course_badges.fetch(title, 'odin-logo.svg')
  end

  def sections
    course.sections.map { |section| SectionDecorator.new(section) }
  end

  private

  def course_badges
    {
      'Web Development 101' => 'badge-webdev101.svg',
      'HTML5 and CSS3' => 'badge-html-css.svg',
      'Ruby Programming' => 'badge-ruby.svg',
      'Javascript and jQuery' => 'badge-javascript.svg',
      'Ruby on Rails' => 'badge-ruby-on-rails.svg',
      'Getting Hired' => 'badge-getting-hired.svg'
    }
  end

  private

  def course
    __getobj__
  end
end
