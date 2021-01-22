class NotificationRequest < ApplicationRecord
  belongs_to :channel, class_name: "NotificationChannel"
end
