json.array!(@knowledges_users) do |knowledges_user|
  json.extract! knowledges_user, :id, :user_id, :knowledge_id
  json.url knowledges_user_url(knowledges_user, format: :json)
end
