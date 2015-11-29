class User < ActiveRecord::Base

  acts_as_messageable

  validates :name, presence: true
  validates :last_name, presence: true

  belongs_to :job
  belongs_to :profile
  belongs_to :sector
  belongs_to :area
  belongs_to :user_status
  has_and_belongs_to_many :projects

  devise :database_authenticatable, :rememberable, :recoverable, :trackable, :validatable

  def mailboxer_email(object)
    email
  end

  def admin?
    self.profile.name == "Administrador" || self.profile.name == "Admin"
  end
  
end