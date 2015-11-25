class Technology < ActiveRecord::Base
	has_many :knowledges
	validates_presence_of :name, :description

end
