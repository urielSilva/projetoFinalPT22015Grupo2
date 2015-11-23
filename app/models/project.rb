class Project < ActiveRecord::Base
  validates_presence_of :description, :price, :link
  belongs_to :project_status
end