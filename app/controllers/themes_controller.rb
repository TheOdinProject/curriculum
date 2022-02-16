class ThemesController < ApplicationController
  ALLOWED_THEMES = %w[light dark].freeze

  def update
    theme = params[:theme]

    if ALLOWED_THEMES.include?(theme)
      cookies.permanent[:theme] = theme
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path, notice: 'Sorry, that theme is not allowed.')
    end
  end
end
