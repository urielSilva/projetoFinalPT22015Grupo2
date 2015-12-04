class Project < ActiveRecord::Base

  has_attached_file :image

  validates_presence_of :description, :price, :link
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  
  belongs_to :project_status
  has_many :project_histories
  has_many :project_member_histories
  has_and_belongs_to_many :users
  
  accepts_nested_attributes_for :users, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

end