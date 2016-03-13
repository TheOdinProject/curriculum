module ApplicationHelper

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
end
