class RequestHistory < ActiveRecord::Base
  belongs_to :request_status
  belongs_to :knowledge_request
end
