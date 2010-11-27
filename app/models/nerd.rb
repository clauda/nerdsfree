class Nerd < ActiveRecord::Base  
  default_scope order(:name)  
  acts_as_taggable

  has_one :confirmation, :dependent => :destroy
  after_create :send_confirm_mail  
  
  validates_presence_of :name, :email
  validates_uniqueness_of :email, :message => 'já está cadastrado.'
  
  AREAS = ['Desenvolvedor', 'WebDesigner']
  
  scope :confirmeds, where(:confirmed => true)
  
  def send_confirm_mail
    Confirmation.create :nerd_id => self.id
  end

  def send_remove_mail
    self.confirmation.send_remove
  end
  
  def confirm!
    self.confirmed = true
    self.save
  end
  
end
