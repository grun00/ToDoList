class TasksController < ApplicationController
  before_action :authenticate_user!, only: %i[index new create show destroy]
  before_action :find_task, only: %i[edit update show confirm_delete destroy]

  def index
    @tasks = Task.where(user: current_user)
    if params[:order].in? %w[asc des high low old new comp incomp]
      case params[:order]
        when 'asc'
          @tasks.order!(:title)
        when 'des'
          @tasks.order!(title: :desc)
        when 'high'
          @tasks.order!(priority: :desc)
        when 'low'
          @tasks.order!(:priority) 
        when 'old'
          @tasks.order!(updated_at: :desc)
        when 'new'
          @tasks.order!(:updated_at) 
        when 'comp'
          @tasks.order!(status: :desc)
        when 'incomp'
          @tasks.order!(:status)
      end
    end
  end

  def show
    if !(@task.user == current_user)
      redirect_to root_path
    end
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

  def edit
  end

  def update 
    if @task.update(task_params)
      flash[:alert] = 'Task Updated!'
      redirect_to @task
    else
      render :edit
    end
  end

  def change_status
    @task = Task.find(params[:task][:task_id])
    @task.update(status: params[:task][:status].to_i)
    redirect_to @task

  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def confirm_delete 
  end

  

  private

  def task_params
    task = params.require(:task).permit(:title, :description)
    task[:priority] = params[:task][:priority].to_i
    task
  end 

  def find_task
    @task = Task.find(params[:id])
  end
end
