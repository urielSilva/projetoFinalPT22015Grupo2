class ActivityType < ActiveRecord::Base

	validates :description, presence: true
	has_many :activities
	
end
