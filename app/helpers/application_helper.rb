module ApplicationHelper

  def chat_link
    'https://gitter.im/TheOdinProject/theodinproject'
  end

  def title(input = nil)
    if input
      content_for(:title) { input + ' | The Odin Project' }
    end
  end

  def convert_markdown_to_html(markdown)
    MarkdownConverter.new(markdown).as_html
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
