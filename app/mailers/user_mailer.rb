class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_comment.subject
  #
  default from:'canopus.t@gmail.com' 

  def notify_comment(user, comment)
    @user = user
    @comment = comment
    mail(to: @user.email, subject:'Thanks for leaving your comment')
  end
end
