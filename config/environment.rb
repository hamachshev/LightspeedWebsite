require 'apnotic'
# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Specify the file path
file_path = Rails.root.join('key.p8')

# Create the file
File.open(file_path, "w") do |file|
  f.write(Rails.application.credentials.dig(:apple,:push_notification_key))
end

# Set ownership and permissions
File.chown(1000, 1000, file_path)  # Change ownership to UID 1000 (rails user) and GID 1000 (rails group)
File.chmod(0644, file_path)        # Set permissions to 0644 (-rw-r--r--)



APNS_CONNECTION = Apnotic::Connection.new(
  auth_method: :token,
  cert_path: "key.p8" ,
  key_id: "3NRUMUU6WC",
  team_id: "6QJ83977FH"
)
