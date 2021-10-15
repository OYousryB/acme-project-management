module Projects
  class UpdateService < BaseService
    attr_accessor :project, :params

    def initialize(project, params)
      @project = project
      @params = params
    end

    def _execute
      project.update(params)
    end
  end
end
