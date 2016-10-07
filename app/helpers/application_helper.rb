module ApplicationHelper

  def chat_link_general
    'https://gitter.im/TheOdinProject/theodinproject'
  end

  def title(input = nil)
    title = ""
    if input
      title += input
      title += "  |  The Odin Project"
    elsif @course
      title += "Learn #{@course.title}"
      if @lesson
        title += " -- #{@lesson.title}"
      else
        title += " for Free"
      end
    else
      title = "Learn Web Development for Free Using Ruby on Rails"
      title += "  |  The Odin Project"
    end
    title
  end

  # uses the redcarpet gem to render the markdown as html
  def md(markdown_in)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {:fenced_code_blocks => true})
    markdown.render(markdown_in).html_safe
  end

  def bootstrap_class_for(flash_type)
    bootstrap_classes.fetch(flash_type.to_sym, custom_flash(flash_type))
  end

  private

  def custom_flash(flash_type)
    "alert-#{flash_type}"
  end

  def bootstrap_classes
    { notice: 'alert-success', alert: 'alert-error' }
  end
end
