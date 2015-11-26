class User < ActiveRecord::Base

  validates :name, presence: true
  validates :last_name, presence: true

  has_and_belongs_to_many :projects

  belongs_to :job
  belongs_to :profile
  belongs_to :sector
  belongs_to :user_status

  devise :database_authenticatable, :rememberable, :trackable, :validatable
  
end