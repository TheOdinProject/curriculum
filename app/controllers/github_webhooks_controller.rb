class GithubWebhooksController < ActionController::Base
  include GithubWebhook::Processor

  def github_push(payload)
    event = ::GithubPushEventAdaptor.new(payload)

    UpdateLessonContentJob.perform_async(event.modified_urls) if event.merged_to_main?
  end

  private

  def webhook_secret(_)
    ENV['GITHUB_WEBHOOK_SECRET']
  end
end
