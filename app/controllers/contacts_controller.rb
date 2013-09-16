class ContactsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @message = Message.new
    @subject = default_subject
    user = User.find_by_id(params[:user_id])
    if user.nil?
      redirect_to root_path and return
    end
    @user = user
  end

  def create
    # TODO
  end

  def default_subject
    "You have a new message from #{current_user.username} of The Odin Project"
  end

end
