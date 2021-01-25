class NotificationMailer < ApplicationMailer
  def self.action_methods
    all_inclusive = Class.new do
      def include?(_); true; end
    end
    all_inclusive.new
  end

  def method_missing(method_name, *args, &block)
    notification = if params[:record]
                      params[:record].to_notification
                    else
                      channel_name = method_name.to_s.remove("_notifier").camelize
                      Notifications::Channel.find_by(name: channel_name).to_noticed_class.with(params)
                    end

    mail(
      to: params[:recipient].email,
      subject: notification.subject,
      body: notification.body
    )
  end

  def respond_to_missing?(method_name, include_private = false)
    super
  end

  # {:recipient=>#<User id: 1, email: "user@mail.com", created_at: "2021-01-22 16:06:20", updated_at: "2021-01-22 16:06:20">, :record=>#<Notification id: 2, recipient_type: "User", recipient_id: 1, type: "CommentNotification", params: {}, read_at: nil, created_at: "2021-01-22 16:10:34", updated_at: "2021-01-22 16:10:34">}
end
