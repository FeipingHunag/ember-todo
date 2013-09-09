class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :completed, :project_id
end
