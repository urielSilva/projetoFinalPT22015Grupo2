json.array!(@projects_users) do |projects_user|
  json.extract! projects_user, :id, :project_id, :user_id
  json.url projects_user_url(projects_user, format: :json)
end
