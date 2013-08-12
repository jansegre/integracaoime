class Student < ActionMailer::Base
  #default from: "from@example.com"

  def welcome_email user
    @user = user
    @subject = t "student.welcome_email.subject"
    mail from: "Integração IME <noreply@integracaoime.com.br>",
         to: user.nice_email,
         subject: @subject
  end
end
