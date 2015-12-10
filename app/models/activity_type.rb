class ActivityType < ActiveRecord::Base

	validates_presence_of :description

	has_many :activities
	
end