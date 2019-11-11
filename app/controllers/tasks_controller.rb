class TasksController < ApplicationController



  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    @task.user = current_user
    @task.save
    flash[:alert] = 'Task Created!'
    redirect_to @task
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
