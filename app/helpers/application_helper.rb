# rubocop:disable Metrics/MethodLength, Layout/LineLength
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
# rubocop:enable Metrics/MethodLength, Layout/LineLength
