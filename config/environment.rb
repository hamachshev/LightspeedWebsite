require 'apnotic'
# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

File.open("key.p8", "w") do |f|

  f.write(Rails.application.credentials.dig(:apple,:push_notification_key))

end
File.chown(1000, 1000, 'key.p8')
# Set read permissions on a file
File.chmod(666, 'key.p8')


APNS_CONNECTION = Apnotic::Connection.new(
  auth_method: :token,
  cert_path: "key.p8" ,
  key_id: "3NRUMUU6WC",
  team_id: "6QJ83977FH"
)
