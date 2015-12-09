class User < ActiveRecord::Base

  # Permite que o usuário envie e receba mensagens
  acts_as_messageable

  # Validação dos campos do usuário (formulário)
  validates_presence_of :name, :last_name, :job, :profile, :sector, :area, :user_status

  # O usuário possui um cargo, um perfil, um núcleo, uma área e um status
  belongs_to :job
  belongs_to :profile
  belongs_to :sector
  belongs_to :area
  belongs_to :user_status

  # O usuário tem vários históricos de projetos e requisições de conhecimento
  has_many :project_member_histories
  has_many :knowledge_requests

  # O usuário tem e pertence a muitas atividades e projetos
  has_and_belongs_to_many :activities
  has_and_belongs_to_many :projects

  # Permite que o usuário tenha tais propriedades
  devise :database_authenticatable, :rememberable, :recoverable, :trackable, :validatable

  # Retorna um email para ser usado no sistema de mensagens
  def mailboxer_email(object)
    email
  end

  # Método que retorna true ou false se o usuário for administrador ou não
  def admin?
    self.profile.name == "Administrador" or self.profile.name == "Admin"
  end

  # Método que retorna true ou false se o usuário for moderador ou não
  def mod?
    self.profile.name == "Moderador"
  end

  # Método que retorna true ou false se o usuário for membro ou não
  def member?
    self.profile.name == "Membro"
  end

  # Método que retorna o nome completo do usuário
  def username
    "#{self.name} #{self.last_name}"
  end

end