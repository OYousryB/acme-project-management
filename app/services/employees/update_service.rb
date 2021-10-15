module Employees
  class UpdateService < BaseService
    attr_accessor :employee, :params

    def initialize(employee, params)
      @employee = employee
      @params = params
    end

    def _execute
      employee.update(params)
    end
  end
end
