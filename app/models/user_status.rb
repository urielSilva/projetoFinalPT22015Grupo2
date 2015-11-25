class UserStatus < ActiveRecord::Base

	validates_presence_of :status
  has_many :users

end