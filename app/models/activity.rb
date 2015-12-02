class Activity < ActiveRecord::Base

	validates :description, presence: true
	validates :credit_numbers, presence: true

	belongs_to :activity_type
	has_and_belongs_to_many :users

end