module MailchimpHelper
  def mailchimp_create_request
    Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
  end

  def mailchimp_get_members(list_id)
    response = mailchimp_create_request.lists(list_id).members.retrieve
    response.body['members']
  end

  def mailchimp_member_exists?(email, list_id)
    members = mailchimp_get_members(list_id)
    members.any? { |member| member['email_address'] == email }
  end

  def mailchimp_remove_member(email, list_id)
    emails = mailchimp_list_member_emails(list_id)
    mailchimp_delete_member(list_id, email) if emails.include?(email)
  end

  private

  def mailchimp_delete_member(list_id, email)
    member_id = mailchimp_hash_email(email)
    mailchimp_create_request.lists(list_id).members(member_id).delete
  end

  def mailchimp_hash_email(email)
    md5 = Digest::MD5.new
    md5.hexdigest(email)
  end

  def mailchimp_list_member_emails(list_id)
    members = mailchimp_get_members(list_id)
    members.map { |member| member['email_address'] }
  end
end
