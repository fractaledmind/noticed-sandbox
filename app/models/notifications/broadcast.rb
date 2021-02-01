module Notifications
  class Broadcast < ApplicationRecord
    self.table_name = :notification_requests

    belongs_to :channel, class_name: "Notifications::Channel", dependent: :destroy

    serialize :params, JSON

    after_create_commit :deliver_notification

    def deliver_notification
      data = params.is_a?(String) ? JSON.parse(params) : params
      channel.to_noticed_class.with(data).deliver(User.all)
    end
  end
end
