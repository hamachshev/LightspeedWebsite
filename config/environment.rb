require 'apnotic'
# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

File.open("/pushNotifications/key.p8", "w") do |f|

  f.write(Rails.application.credentials.dig(:apple,:push_notification_key))

end

# Set read permissions on a file
File.chmod(666, '/pushNotifications/key.p8')


APNS_CONNECTION = Apnotic::Connection.new(
  auth_method: :token,
  cert_path: "/pushNotifications/key.p8" ,
  key_id: "3NRUMUU6WC",
  team_id: "6QJ83977FH"
)
