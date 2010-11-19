class Confirmation < ActiveRecord::Base
  belongs_to :nerd
  before_create :generate_token
  
  def generate_token
    self.token = ActiveSupport::SecureRandom.base64(44).tr('+/=', 'xyz')
  end

  private
  
  def send_confirmation
    generate_token! if self.token.nil?
    ConfirmationMailer.send_email(self.nerd).deliver
  end
  
end
