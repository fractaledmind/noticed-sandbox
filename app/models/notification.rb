class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true

  def to_notification
    name = type.remove("Notifier")
    NotificationChannel.find_by(name: name).to_noticed_class.with(params)
  end
end
