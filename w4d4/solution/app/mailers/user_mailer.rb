class UserMailer < ApplicationMailer

  def welcome_mail(user)
    @user = user
    @url = 'http://example.com/session/new'
    mail(to: user.mail, subject: "Welcome to my world!")
  end
end
