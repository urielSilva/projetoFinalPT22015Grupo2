json.array!(@knowledge_requests) do |knowledge_request|
  json.extract! knowledge_request, :id, :knowledge_id, :user_id
  json.url knowledge_request_url(knowledge_request, format: :json)
end
