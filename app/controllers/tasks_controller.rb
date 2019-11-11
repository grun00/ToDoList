class TasksController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    @task.user = current_user
    if @task.save
      flash[:alert] = 'Task Created!'
      redirect_to @task
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  private

  def task_params
    task = params.require(:task).permit(:title, :description)
    task[:priority] = params[:task][:priority].to_i
    task
  end
end
