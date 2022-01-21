class ThemeSwitcherComponent < ViewComponent::Base
  def initialize(theme:, mobile: false, icon_only: false)
    @theme = theme
    @mobile = mobile
    @icon_only = icon_only
  end

  def dark_mode?
    theme == 'dark'
  end

  def icon
    dark_mode? ? 'sun' : 'moon'
  end

  def text
    dark_mode? ? 'Light Mode' : 'Dark Mode'
  end

  def other_theme
    dark_mode? ? 'light' : 'dark'
  end

  attr_reader :theme, :mobile, :icon_only
end
