class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subject

  def new
    @message = Message.new
    @user = User.find params[:user_id]
    redirect_to root_path if @user.nil?
  end

  def create
    @user = User.find params[:user_id]
    @message = Message.new({
        :body => params[:body].html_safe,
        :subject => @subject,
        :recipient => @user,
        :sender => current_user
      })
    if @message.valid?
      UserMailer.send_mail_to_user(@message).deliver_now
      flash[:success] = "Your message to #{@user.username} has been sent!"
      redirect_to user_path(@user)
    else
      flash.now[:error] = "Please fill out the message form"
      render :new
    end
  end

  private
  def set_subject
    @subject = "You have a new message from #{current_user.username} of The Odin Project"
  end
end
