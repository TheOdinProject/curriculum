# rubocop:disable Metrics/MethodLength, Layout/LineLength, Metrics/ModuleLength
module ApplicationHelper
  require 'kramdown'

  def github_link(extension = '')
    "https://github.com/TheOdinProject/#{extension}"
  end

  def title(input = nil)
    content_for(:title) { "#{input} | The Odin Project" } if input
  end

  def bootstrap_class_for(flash_type)
    bootstrap_classes.fetch(flash_type, custom_flash(flash_type))
  end

  def how_it_works_tiles
    [
      {
        image: 'img-learn.svg',
        subtitle: 'Learn',
        description: 'Learn from a curriculum with the best curated online tutorials, blogs, and courses.'
      },
      {
        image: 'img-build.svg',
        subtitle: 'Build',
        description: 'Build dozens of portfolio-worthy projects along the way, from simple scripts to full programs and deployed websites.'
      },
      {
        image: 'img-connect.svg',
        subtitle: 'Connect',
        description: 'You’re not alone. Learn and get help from our friendly community of beginner and experienced developers.'
      }
    ]
  end

  def available_courses
    [
      {
        badge_image_url: 'badge-html-css.svg',
        badge_alt_text: 'html css badge',
        title: 'Intermediate HTML+CSS',
        path: '/paths/full-stack-javascript/courses/intermediate-html-and-css'
      },
      {
        badge_image_url: 'badge-html-css.svg',
        badge_alt_text: 'html css badge',
        title: 'Advanced HTML+CSS',
        path: '/paths/full-stack-javascript/courses/advanced-html-and-css'
      },
      {
        badge_image_url: 'badge-javascript.svg',
        badge_alt_text: 'javascript badge',
        title: 'JavaScript',
        path: '/paths/full-stack-javascript/courses/javascript'
      },
      {
        badge_image_url: 'badge-git.svg',
        badge_alt_text: 'git badge',
        title: 'Git',
        path: '/paths/foundations/courses/foundations#git-basics'
      },
      {
        badge_image_url: 'badge-database.svg',
        badge_alt_text: 'databases badge',
        title: 'Databases',
        path: '/paths/full-stack-ruby-on-rails/courses/databases'
      },
      {
        badge_image_url: 'badge-ruby.svg',
        badge_alt_text: 'ruby badge',
        title: 'Ruby',
        path: '/paths/full-stack-ruby-on-rails/courses/ruby'
      },
      {
        badge_image_url: 'badge-ruby-on-rails.svg',
        badge_alt_text: 'ruby on rails badge',
        title: 'Ruby on Rails',
        path: '/paths/full-stack-ruby-on-rails/courses/ruby-on-rails'
      },
      {
        badge_image_url: 'badge-nodejs.svg',
        badge_alt_text: 'nodejs badge',
        title: 'NodeJS',
        path: '/paths/full-stack-javascript/courses/nodejs'
      },
      {
        badge_image_url: 'badge-getting-hired.svg',
        badge_alt_text: 'getting hired badge',
        title: 'Getting Hired',
        path: '/paths/full-stack-javascript/courses/getting-hired'
      }
    ]
  end

  def sign_in_or_view_curriculum_button
    if current_user
      curriculum_button
    else
      signup_button
    end
  end

  def percentage_completed_by_user(course, user)
    user.progress_for(course).percentage
  end

  def course_completed_by_user?(course, user)
    user.progress_for(course).completed?
  end

  def next_lesson_to_complete(course, completed_lessons)
    NextLesson.new(course, completed_lessons).to_complete
  end

  def unread_notifications?(user)
    user.notifications.any?(&:unread?)
  end

  private

  def custom_flash(flash_type)
    "alert-#{flash_type}"
  end

  def bootstrap_classes
    { 'notice' => 'alert-success', 'alert' => 'alert-danger' }
  end
end
# rubocop:enable Metrics/MethodLength, Layout/LineLength, Metrics/ModuleLength
