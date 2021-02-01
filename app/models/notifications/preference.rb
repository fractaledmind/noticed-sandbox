module Notifications
  class Preference < ApplicationRecord
    self.table_name = :notification_permissions

    belongs_to :channel, class_name: "Notifications::Channel", dependent: :destroy
    belongs_to :user
  end
end
