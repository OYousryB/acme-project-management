module Projects
  class DeleteParticipentService < BaseService
    attr_accessor :project, :params

    def initialize(project, params)
      @project = project
      @params = params
    end

    def _execute
      participent = Participant.find_by(params.merge(project_id: project.id))
      participent.destroy
    end
  end
end
