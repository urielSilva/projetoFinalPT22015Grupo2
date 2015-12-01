class ProjectMemberHistory < ActiveRecord::Base

  validates_presence_of :observation, :project, :user, :project_role

  belongs_to :project
  belongs_to :user
  belongs_to :project_role

end