json.array!(@project_histories) do |project_history|
  json.extract! project_history, :id, :observation, :project_id, :project_status_id
  json.url project_history_url(project_history, format: :json)
end
