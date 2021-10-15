module Projects
  class AssignParticipentService < BaseService
    attr_accessor :project, :params

    def initialize(project, params)
      @project = project
      @params = params
    end

    def _execute
      Participant.create(params.merge(project_id: project.id))
    end
  end
end
