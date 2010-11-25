class ConfirmationMailer < ActionMailer::Base
  default :from => "noreply@krawdyah.com"
  
  def confirm_mail(nerd)
    @user = nerd
    @confirm  = "http://nerdshall.heroku.com/confirm/#{nerd.confirmation.token}"
    @remove  = "http://nerdshall.heroku.com/remove/#{nerd.confirmation.token}"
    mail(:to => nerd.email, :subject => "Nerds Hall")
  end
  
  def remove_mail(nerd)
    @user = nerd
    @url  = "http://nerdshall.heroku.com/remove/#{nerd.confirmation.token}"
    mail(:to => nerd.email, :subject => "Nerds Hall")
  end
  
end
