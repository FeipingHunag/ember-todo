class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  respond_to :json

  def index
    render json: Project.all
  end

  def show
    render json: @project
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      render json: @project
    else
      render json: { errors: @project.errors }, status: :unprocessable_entity
    end

  end

  def update
    if @project.update(project_params)
      head :no_content
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description)
    end
end
