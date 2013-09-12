class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    render json: Task.find(params[:ids])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: @task
    else
      render json: { errors: @task.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      head :no_content
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end


  def destroy
    @task.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :completed, :project_id)
    end
end
