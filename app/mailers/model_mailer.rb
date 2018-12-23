class ModelMailer < ApplicationMailer
default from: "me@MYDOMAIN.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_record_notification.subject
  #
  def new_record_notification(record)
  @record = record
  mail to: current_user.email, subject: "Change Password"
end
end
