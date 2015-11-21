class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  validates :name, presence: true
  validates :last_name, presence: true

  belongs_to :job
  belongs_to :profile
  belongs_to :sector

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

end