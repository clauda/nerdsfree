class Nerd < ActiveRecord::Base  
  default_scope order(:name)  
  acts_as_taggable
  has_one :confirmation
  before_create :confirm  
  
  validates_presence_of :name, :email
  validates_uniqueness_of :email
  
  AREAS = ['Desenvolvedor', 'Designer']
  
  scope :confirmeds, joins(:confirmation).where("confirmations.token IS NULL")
  
  def confirm
    self.confirmation = Confirmation.create!
  end
  
end
