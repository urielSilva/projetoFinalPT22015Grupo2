class KnowledgesUser < ActiveRecord::Base

  validates_presence_of :user, :knowledge

  belongs_to :user
  belongs_to :knowledge
  
end