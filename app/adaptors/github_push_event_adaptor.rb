class GithubPushEventAdaptor
  def initialize(payload)
    @payload = payload
  end

  def merged_to_main?
    payload[:ref] == 'refs/heads/main'
  end

  def modified_urls
    payload[:head_commit][:modified].map { |url| "/#{url}" }
  end

  private

  attr_reader :payload
end
