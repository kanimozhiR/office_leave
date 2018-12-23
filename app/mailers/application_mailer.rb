class ApplicationMailer < ActionMailer::Base
  default from: 'test@example.com'
  layout 'mailer'
  def password_change
 mail(to: @resource.email, subject: 'not reply this message').deliver
 end

end
