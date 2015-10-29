class KnowledgeLevel < ActiveRecord::Base
	validates_presence_of :level, :description
end
