class UserMailerPreview < ActionMailer::Preview
  def welcome_mail_preview
    UserMailer.welcome_email(User.first)
  end
end