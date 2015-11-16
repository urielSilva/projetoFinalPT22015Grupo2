json.array!(@knowledges) do |knowledge|
  json.extract! knowledge, :id, :level, :description
  json.url knowledge_level_url(knowledge_level, format: :json)
end