module BootstrapFlashHelper

  def bootstrap_flash
    flash.each do |type, message|
      puts "*" * 100
      puts type
      puts message
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      # convert type to symbol (it might be a string)
      type = type.to_sym
      # convert to bootstrap flash messages
      type = :success if type == :notice
      type = :error   if type == :alert
      # skip if alert types does not include type


      Array(message).each do |msg|
        text = content_tag(:div,
                           content_tag(:button, raw("&times;"), :class => "close", "data-dismiss" => "alert") +
                           msg.html_safe, :class => "alert fade in alert-#{type}")
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end

  private

  def alert_types
    [:error, :info, :success, :warning]
  end

  def flash_messages
    @flash_messages ||= []
  end
end
