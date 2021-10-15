module Projects
  class CreateService < BaseService
    attr_accessor :params

    def initialize(params)
      @params = params
    end

    def _execute
      Project.create(params)
    end
  end
end
