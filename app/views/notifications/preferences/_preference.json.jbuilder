json.extract! notification_preference, :id, :channel_id, :user_id, :local, :email, :created_at, :updated_at
json.url notifications_preference_url(notification_preference, format: :json)
