class Technology < ActiveRecord::Base

	validates_presence_of :name, :description
  
  has_many :knowledges

end
