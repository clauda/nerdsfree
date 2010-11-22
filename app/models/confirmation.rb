class Confirmation < ActiveRecord::Base
  belongs_to :nerd
  after_create :send_confirm
  
  def send_confirm
    generate_token! if self.token.nil?
    ConfirmationMailer.confirm_mail(self.nerd).deliver
  end
  
  def send_remove
    generate_token! if self.token.nil?
    ConfirmationMailer.remove_mail(self.nerd).deliver
  end

  private
  
  def generate_token!
    self.token = ActiveSupport::SecureRandom.base64(44).tr('+/=', 'xyz')
    self.save
  end
  
end
