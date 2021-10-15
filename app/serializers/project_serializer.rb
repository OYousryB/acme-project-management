class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :state, :owner
  attributes :participant_employees
  attributes :active_projects

  def active_projects
    Project.active_projects
  end
end
