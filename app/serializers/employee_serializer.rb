class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email
  attributes :name, :created_at
  attributes :department, :role
  attributes :participant_projects
end
