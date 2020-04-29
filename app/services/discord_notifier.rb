class DiscordNotifier
  def initialize(notification)
    @notification = notification
  end

  def self.notify(notification)
    new(notification).notify
  end

  def notify
    client.execute do |builder|
      builder.content = notification.message
    end
  end

  private

  attr_reader :notification

  def client
    Discordrb::Webhooks::Client.new(url: ENV['DISCORD_LESSON_COMPLETION_WEBHOOK_URL'])
  end
end
