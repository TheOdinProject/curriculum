class StaticPagesController < ApplicationController
  def home
    redirect_to dashboard_path if user_signed_in?
  end

  def about; end

  def faq; end

  def terms_of_use; end

  def style_guide; end

  def success_stories
    @success_stories = SuccessStory.all
  end
end
