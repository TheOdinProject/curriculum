class ThemeSwitcherComponent < ViewComponent::Base
  def initialize(theme:)
    @theme = theme
  end

  def dark_mode?
    @theme == 'dark'
  end
end
