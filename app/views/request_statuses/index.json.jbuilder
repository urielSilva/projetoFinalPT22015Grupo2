json.array!(@request_statuses) do |request_status|
  json.extract! request_status, :id, :status
  json.url request_status_url(request_status, format: :json)
end
