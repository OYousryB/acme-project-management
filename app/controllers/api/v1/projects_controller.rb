class Api::V1::ProjectsController < ApplicationController
  before_action :set_projects, only: [:index]
  before_action :set_project, only: %i[show update assign_participant remove_participant]

  def create
    project = Projects::CreateService.new(project_params).execute

    if project.persisted?
      render json: project, status: :created, serializer: ProjectSerializer
    else
      render json: { errors: project.errors }, status: :unprocessable_entity
    end
  end

  def update
    updated_project = Projects::UpdateService.new(@project, project_params.except(:owner_id)).execute
    if updated_project
      render json: @project, status: :ok, serializer: ProjectSerializer
    else
      render json: { errors: @project.errors }, status: :unprocessable_entity
    end
  end

  def assign_participant
    updated_project = Projects::AssignParticipentService.new(@project, project_params).execute
    if updated_project.persisted?
      render json: @project, status: :ok, serializer: ProjectSerializer
    else
      render json: { errors: updated_project.errors }, status: :unprocessable_entity
    end
  end

  def remove_participant
    Projects::DeleteParticipentService.new(@project, project_params).execute
    head :no_content
  end

  def index
    render json: @projects, each_serializer: ProjectSerializer
  end

  def show
    render json: @project, serializer: ProjectSerializer
  end

  private

  def project_params
    params.require(:project).permit(:name, :owner_id, :state, :employee_id, :project_id)
  end

  def set_projects
    @projects = Project.all
  end

  def set_project
    @project = Project.find_by(id: params[:id] || params[:project_id])
  end
end
