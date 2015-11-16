class TypeActivity < ActiveRecord::Base
	validates_presence_of :Type_Activity_description
	has_many :activity
end
