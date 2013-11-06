module ApplicationHelper

  def title(input = nil, lesson = false)
    if input
      if lesson == true
        "#{input}"
      else
        "The Odin Project -- #{input}"
      end
    else
      "The Odin Project -- The Free Curriculum for Learning Web Development with Ruby on Rails"
    end
  end

  # uses the redcarpet gem to render the markdown as html
  def md(markdown_in)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(markdown_in).html_safe
  end

end
