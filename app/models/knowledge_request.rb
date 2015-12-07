class KnowledgeRequest < ActiveRecord::Base
  belongs_to :knowledge
  belongs_to :user
end