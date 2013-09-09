json.array!(@projects) do |project|
  json.extract! project, :name, :description
  json.url project_url(project, format: :json)
end
