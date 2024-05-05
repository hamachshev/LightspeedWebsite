json.extract! push_notification, :id, :title, :body, :badge, :sound, :created_at, :updated_at
json.url push_notification_url(push_notification, format: :json)
