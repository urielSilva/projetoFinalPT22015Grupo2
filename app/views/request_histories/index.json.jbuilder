json.array!(@request_histories) do |request_history|
  json.extract! request_history, :id, :request_status_id, :knowledge_request_id, :observation
  json.url request_history_url(request_history, format: :json)
end
