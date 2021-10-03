# frozen_string_literal: true

# rubocop:disable Lint/MissingSuper
class NotificationComponent < ViewComponent::Base
  def initialize(notification:)
    @notification = notification
  end

  # rubocop:disable Metrics/MethodLength
  def notification_read_status_icon
    if @notification.read?
      inline_svg_tag 'icons/icon-read-notification.svg',
                     class: 'h-6 w-6 text-nav-link-read',
                     aria: true,
                     title: 'read notification',
                     desc: 'an image showing that a notification has been read'
    else
      inline_svg_tag 'icons/icon-unread-notification.svg',
                     class: 'h-6 w-6 text-nav-link-unread',
                     aria: true,
                     title: 'unread notification',
                     desc: 'an image showing that a notification has not been read'

    end
  end
  # rubocop:enable Metrics/MethodLength
end
# rubocop:enable Lint/MissingSuper
