json.extract! notification_channel, :id, :name, :subject_template, :body_template, :created_at, :updated_at
json.url notification_channel_url(notification_channel, format: :json)
