class RequestHistory < ActiveRecord::Base

  validates_presence_of :knowledge_request, :observation

  belongs_to :knowledge_request
  belongs_to :user

end