# frozen_string_literal: true

# rubocop:disable Lint/MissingSuper
class NotificationComponent < ViewComponent::Base
  def initialize(notification:)
    @notification = notification
  end

  def notification_read_status_icon
    if @notification.read?
      helpers.svg_icon('icon-read-notification')
    else
      helpers.svg_icon('icon-unread-notification')
    end
  end
end
# rubocop:enable Lint/MissingSuper
