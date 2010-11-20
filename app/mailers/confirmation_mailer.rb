class ConfirmationMailer < ActionMailer::Base
  default :from => "noreply@krawdyah.com"
  
  def confirm_mail(nerd)
    @user = nerd
    @url  = "http://nerdsfree.heroku.com/confirm/#{nerd.confirmation.token}"
    mail(:to => nerd.email, :subject => "Nerds for Free")
  end
  
  def remove_mail(nerd)
    @user = nerd
    @url  = "http://nerdsfree.heroku.com/remove/#{nerd.confirmation.token}"
    mail(:to => nerd.email, :subject => "Nerds for Free")
  end
  
end
