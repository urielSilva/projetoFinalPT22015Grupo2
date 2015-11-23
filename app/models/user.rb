class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  belongs_to :job
  belongs_to :sector

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

end