class Project < ActiveRecord::Base

  validates_presence_of :description, :price, :link

  belongs_to :project_status
  has_many :project_histories
  has_many :project_member_histories
  has_and_belongs_to_many :users
  
  accepts_nested_attributes_for :users, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

end