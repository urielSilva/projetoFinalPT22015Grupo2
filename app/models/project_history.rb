class ProjectHistory < ActiveRecord::Base

  validates_presence_of :observation, :project_id, :project_status_id

  belongs_to :project
  belongs_to :project_status

end