module Employees
  class CreateService < BaseService
    attr_accessor :params

    def initialize(params)
      @params = params
    end

    def _execute
      Employee.create(params)
    end
  end
end
