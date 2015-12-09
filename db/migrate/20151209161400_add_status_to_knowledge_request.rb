class AddStatusToKnowledgeRequest < ActiveRecord::Migration
  def change
    add_reference :knowledge_requests, :request_status, index: true, foreign_key: true
  end
end
