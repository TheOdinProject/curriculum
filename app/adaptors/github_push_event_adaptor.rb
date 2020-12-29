class GithubPushEventAdaptor
  def initialize(payload)
    @payload = payload
  end

  def merged_to_master?
    payload[:ref] == 'refs/heads/master'
  end

  def modified_urls
    payload[:head_commit][:modified].map { |url| "/#{url}" }
  end

  private

  attr_reader :payload
end
