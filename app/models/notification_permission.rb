class NotificationPermission < ApplicationRecord
  belongs_to :channel, class_name: "NotificationChannel"
  belongs_to :user
end
