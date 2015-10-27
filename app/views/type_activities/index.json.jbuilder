json.array!(@type_activities) do |type_activity|
  json.extract! type_activity, :id, :Type_Activity_description
  json.url type_activity_url(type_activity, format: :json)
end
