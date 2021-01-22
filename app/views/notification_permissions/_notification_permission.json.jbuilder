json.extract! notification_permission, :id, :channel_id, :user_id, :local, :email, :created_at, :updated_at
json.url notification_permission_url(notification_permission, format: :json)
