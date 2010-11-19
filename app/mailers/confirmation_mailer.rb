class ConfirmationMailer < ActionMailer::Base
  default :from => "noreply@krawdyah.com"
  
  def send_email(nerd)
    @user = nerd
    @url  = "http://example.com/login"
    mail(:to => nerd.email,
         :subject => "Welcome to My Awesome Site")
  end
end
