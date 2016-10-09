module ApplicationHelper

  def chat_link
    'https://gitter.im/TheOdinProject/theodinproject'
  end

  def title(input = nil)
    if input
      content_for(:title) { input + ' | The Odin Project' }
    end
  end

  # uses the redcarpet gem to render the markdown as html
  def md(markdown_in)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {:fenced_code_blocks => true})
    markdown.render(markdown_in).html_safe
  end

  def bootstrap_class_for(flash_type)
    bootstrap_classes.fetch(flash_type, custom_flash(flash_type))
  end

  private

  def custom_flash(flash_type)
    "alert-#{flash_type}"
  end

  def bootstrap_classes
    { 'notice' => 'alert-success', 'alert' => 'alert-error' }
  end
end
