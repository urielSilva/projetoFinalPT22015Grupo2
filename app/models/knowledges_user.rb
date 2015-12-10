class KnowledgesUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :knowledge
end
