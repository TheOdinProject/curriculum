class ContactsController < ApplicationController

  def new
    @message = Message.new
    user = User.find_by_id(params[:id])
    if user.nil?
      redirect_to root_path and return
    end
  end

  def create
    # TODO
  end

end
