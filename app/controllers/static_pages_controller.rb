class StaticPagesController < ApplicationController
  def home
    @navbar = false
    @is_home_page = true
  end

  def about
  end

  def getting_involved
  end

  def legal
  end

  def tou
  end

  def cla
  end

  def suggestion
    if suggestion_body_not_empty?
      ContactMailer.suggestion_email(
        suggestion_body,
        current_page,
        user_identifier
      ).deliver_now
    end

    respond_to do |format|
      format.json { render json: suggestion_body }
    end
  end

  private

  def user_identifier
    current_user_email || 'Anonymous'
  end

  def current_user_email
    (current_user && current_user.email)
  end

  def current_page
    params[:pathname]
  end

  def suggestion_body
    @suggestion_body ||= params[:suggestion]
  end

  def suggestion_body_not_empty?
    !suggestion_body.empty?
  end
end
