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
    @user = User.find_by_id(params[:user_id])
    @message = Message.new({
        :body => params[:body].html_safe,
        :subject => default_subject,
        :recipient => @user,
        :sender => current_user
      })
    if @message.valid?
      UserMailer.send_mail_to_user(@message).deliver
      flash[:success] = "Your message to #{@user.username} has been sent!"
      redirect_to(user_path(@user))
    else
      flash.now[:error] = "Please fill out the message form"
      render :new
    end

  end

  def default_subject
    "You have a new message from #{current_user.username} of The Odin Project"
  end

end
