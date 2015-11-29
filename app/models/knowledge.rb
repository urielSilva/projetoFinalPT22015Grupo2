class Knowledge < ActiveRecord::Base

  validates_presence_of :description

  belongs_to :knowledge_level
  belongs_to :technology

end
