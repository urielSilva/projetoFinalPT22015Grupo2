class ActivitiesUser < ActiveRecord::Base

  validates_presence_of :user_id, :activity_id

  belongs_to :user
  belongs_to :activity
  
end
