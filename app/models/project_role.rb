class ProjectRole < ActiveRecord::Base

  validates_presence_of :role
  
  has_many :projects_users
  has_many :project_member_histories

end