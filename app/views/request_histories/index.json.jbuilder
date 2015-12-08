json.array!(@request_histories) do |request_history|
  json.extract! request_history, :id, :deferido, :observation, :knowledge_request_id
  json.url request_history_url(request_history, format: :json)
end
