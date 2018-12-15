class MailchimpSubscription
  attr_reader :email, :username, :signup_date
  private :email, :username, :signup_date

  def initialize(options)
    @email = options[:email]
    @username = options[:username]
    @signup_date = options[:signup_date]
  end

  def self.create(options)
    instance = new(options)
    instance.create
    instance
  end

  def create
    mailchimp_list.members.create(body: subscriber_details)
  rescue Gibbon::MailChimpError => e
    NewRelic::Agent.notice_error(e)
  end

  private

  def mailchimp_list
    request.lists(ENV['MAILCHIMP_LIST_ID'])
  end

  def subscriber_details
    {
      email_address: email,
      status: :subscribed,
      merge_fields: merge_fields
    }
  end

  def merge_fields
    {
      USERNAME: username,
      SIGNUPDATE: signup_date
    }
  end

  def request
    Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
  end
end
