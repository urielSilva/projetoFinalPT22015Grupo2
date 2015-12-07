class User < ActiveRecord::Base

  acts_as_messageable

  validates :name, presence: true
  validates :last_name, presence: true

  belongs_to :job
  belongs_to :profile
  belongs_to :sector
  belongs_to :area
  belongs_to :user_status
  has_many :project_member_histories
  has_many :knowledge_requests
  has_and_belongs_to_many :activities

  has_and_belongs_to_many :projects

  devise :database_authenticatable, :rememberable, :recoverable, :trackable, :validatable

  def mailboxer_email(object)
    email
  end

  def admin?
    self.profile.name == "Administrador" or self.profile.name == "Admin"
  end

  def mod?
    self.profile.name == "Moderador"
  end

  def member?
    self.profile.name == "Membro"
  end

  def username
    "#{self.name} #{self.last_name}"
  end

end