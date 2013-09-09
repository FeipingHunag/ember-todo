json.array!(@tasks) do |task|
  json.extract! task, :name, :completed, :project
  json.url task_url(task, format: :json)
end
