json.extract! notification_broadcast, :id, :channel_id, :params, :created_at, :updated_at
json.url notifications_broadcast_url(notification_broadcast, format: :json)
