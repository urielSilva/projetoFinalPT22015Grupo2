class ProjectsUser < ActiveRecord::Base

  validates_presence_of :project, :user, :project_role

  belongs_to :project
  belongs_to :user
  belongs_to :project_role
  
end