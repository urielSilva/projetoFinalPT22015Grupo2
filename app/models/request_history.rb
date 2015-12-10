class RequestHistory < ActiveRecord::Base

  validates_presence_of :request_status, :knowledge_request

  belongs_to :request_status
  belongs_to :knowledge_request

end