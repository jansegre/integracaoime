class Staff < ActionMailer::Base

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.staff.feedback_email.subject
  #
  def feedback_email user, subject, message
    @user = user
    @message = message
    #@subject = t "mail.feedback.subject", name: @user.name
    @subject = subject

    mail from: "feedback@segre.in",
         to: User.admins.map{ |u| u.email },
         subject: @subject
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.staff.contact_email.subject
  #
  def contact_email message, name
    @name = name
    @message = message
    @subject = t "mail.contact.subject", name: @name

    mail from: "contact@segre.in",
         to: User.admins.map{ |u| u.email },
         subject: @subject
  end
end
