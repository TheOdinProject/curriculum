class StaticPagesController < ApplicationController
  before_action :redirect_if_logged_in, only: :home

  def home
  end

  def about
  end

  def faq
  end

  def terms_of_use
  end

  def style_guide
  end

  def success_stories
    @success_stories = SuccessStory.all
  end

  private

  def redirect_if_logged_in
    redirect_to dashboard_path if current_user
  end
end
