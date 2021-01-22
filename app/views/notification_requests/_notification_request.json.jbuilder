json.extract! notification_request, :id, :channel_id, :params, :created_at, :updated_at
json.url notification_request_url(notification_request, format: :json)
