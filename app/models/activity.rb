class Activity < ActiveRecord::Base

  validates_presence_of :description, :credit_numbers

	belongs_to :activity_type
	has_and_belongs_to_many :users

end