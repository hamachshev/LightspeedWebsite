require 'apnotic'
APNS_CONNECTION = Apnotic::Connection.new(
  auth_method: :token,
  cert_path: Rails.application.credentials.dig(:apple,:push_notifications_key),
  key_id: "3NRUMUU6WC",
  team_id: "6QJ83977FH"
)