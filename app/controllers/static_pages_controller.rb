class StaticPagesController < ApplicationController
  def home
    @success_stories = SuccessStory.limit(4)
    @courses = Course.badges
  end

  def about; end

  def faq; end

  def terms_of_use; end

  def success_stories
    @success_stories = SuccessStory.all
  end
end
