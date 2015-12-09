class KnowledgeRequest < ActiveRecord::Base
  belongs_to :knowledge
  belongs_to :user
  has_many :request_histories
end