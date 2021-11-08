class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications
  end

  def update
    notification = current_user.notifications.find(params[:id])

    if notification.mark_as_read!
      redirect_to notification.url
    else
      render :index, notice: 'Could not redirect to the notification url.'
    end
  end
end
