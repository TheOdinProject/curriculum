class LogoComponent < ViewComponent::Base
  def initialize(theme:, classes:)
    @theme = theme
    @classes = classes
  end

  def dark_mode?
    theme == 'dark'
  end

  def text_color_class
    dark_mode? ? 'text-gray-50' : 'text-gray-800'
  end

  attr_reader :theme, :classes
end
