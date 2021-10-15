class Api::V1::EmployeesController < ApplicationController
  before_action :set_employees, only: [:index]
  before_action :set_employee, only: %i[show update]

  def create
    employee = Employees::CreateService.new(employee_params).execute

    if employee.persisted?
      render json: employee, status: :created, serializer: EmployeeSerializer
    else
      render json: { errors: employee.errors }, status: :unprocessable_entity
    end
  end

  def update
    updated_employee = Employees::UpdateService.new(@employee, employee_params).execute
    if updated_employee
      render json: @employee, status: :ok, serializer: EmployeeSerializer
    else
      render json: { errors: updated_employee.errors }, status: :unprocessable_entity
    end
  end

  def index
    render json: @employees
  end

  def show
    render json: @employee
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :department, :role, :email)
  end

  def set_employees
    @employees = Employee.all
  end

  def set_employee
    @employee = Employee.find_by(id: params[:id])
  end
end
