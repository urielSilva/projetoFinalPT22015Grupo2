class Activity < ActiveRecord::Base

	validates :description, presence: true
	validates :credit_numbers, presence: true

	belongs_to :activity_type

end