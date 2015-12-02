json.array!(@activities_users) do |activities_user|
  json.extract! activities_user, :id, :user_id, :activity_id
  json.url activities_user_url(activities_user, format: :json)
end
