class ProjectStatus < ActiveRecord::Base

  validates_presence_of :status

	has_many :projects
  
end
