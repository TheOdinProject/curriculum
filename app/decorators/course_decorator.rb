class CourseDecorator < ApplicationDecorator

  def badge
    course_badges.fetch(title, 'odin-logo.svg')
  end

  def borderless_badge
    borderless_badges.fetch(title, 'odin-logo.svg')
  end

  def sections
    course.sections.map { |section| SectionDecorator.new(section) }
  end

  private

  def borderless_badges
    {
      'Web Development 101' => 'badges/badge-webdev-101-borderless.svg',
      'HTML and CSS' => 'badges/badge-html-borderless.svg',
      'Ruby Programming' => 'badges/badge-ruby-borderless.svg',
      'Javascript' => 'badges/badge-javascript-borderless.svg',
      'Ruby on Rails' => 'badges/badge-ruby-on-rails-borderless.svg',
      'Getting Hired' => 'badges/badge-getting-hired-borderless.svg',
      'Databases' => 'badges/badge-database-borderless.svg',
    }
  end

  def course_badges
    {
      'Web Development 101' => 'badge-webdev101.svg',
      'HTML and CSS' => 'badge-html-css.svg',
      'Ruby Programming' => 'badge-ruby.svg',
      'Javascript' => 'badge-javascript.svg',
      'Ruby on Rails' => 'badge-ruby-on-rails.svg',
      'Getting Hired' => 'badge-getting-hired.svg',
      'Databases' => 'badge-database.svg'
    }
  end

  private

  def course
    __getobj__
  end
end
