require 'digest/sha1'
require 'base64'
require 'json'
 
# timestamp (in seconds). Improves security.
timestamp = Time.now.to_i
 
# SSO object contains the user information, where
#
# - id identifies the user. A different id represents a different user
# - displayname is the full name
# - is_admin, `true` gives administrative rights.
sso = {
   :user => {
      :id => 'johndoe', # required
      :displayname => 'John Doe', # required
      :email => 'john.doe@gmail.com',
      :avatar => '//gravatar.com/avatar/e5fb96fe7ec4ac3d4fa675422f8d1fb9',
      :is_admin => true,
   }
}
 
# The SSO object as base64 encoded string. Not readable by humans.
message = Base64.strict_encode64 sso.to_json
 
# The SSO object is coupled with a hashed signature. This must always be
# generated on the server since the provided secret key should not be seen
# by anyone else but you.
signature = Digest::SHA1.hexdigest "testapisecretkey #{message} #{timestamp}"
 
# Output the values
puts "timestamp: #{timestamp}"
puts "signature: #{signature}"
puts "message: #{message}"