class ActivityType < ActiveRecord::Base

	validates :description, presence: true

end
