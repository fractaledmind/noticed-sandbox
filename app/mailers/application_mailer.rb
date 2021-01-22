class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def comment_notification
    # {:recipient=>#<User id: 1, email: "user@mail.com", created_at: "2021-01-22 16:06:20", updated_at: "2021-01-22 16:06:20">, :record=>#<Notification id: 2, recipient_type: "User", recipient_id: 1, type: "CommentNotification", params: {}, read_at: nil, created_at: "2021-01-22 16:10:34", updated_at: "2021-01-22 16:10:34">}
    mail(body: "#{params[:recipient].email} | #{params[:record].type}")
  end
end
