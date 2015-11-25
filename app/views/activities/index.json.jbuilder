json.array!(@activities) do |activity|
  json.extract! activity, :id, :description, :credit_numbers
  json.url activity_url(activity, format: :json)
end
