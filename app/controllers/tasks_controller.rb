class TasksController < ApplicationController
  before_action :authenticate_user!, only: %i[index new create destroy search]
  before_action :find_task, only: %i[edit update show confirm_delete destroy]
  skip_before_action :verify_authenticity_token, only: %i[search]
  
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
    if @task.share == false
      authenticate_user!  
      if !(@task.user == current_user)
        redirect_to root_path
      end
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

  def search
    @results = Task.where("title LIKE ?", "%#{sanitize_sql_like(params[:q])}%").where(user: current_user)
  end
  
  def complete
    @tasks = Task.where(user: current_user).complete
  end

  def incomplete
    @tasks = Task.where(user: current_user).incomplete
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

  def sanitize_sql_like(string, escape_character = "\\")
    pattern = Regexp.union(escape_character, "%", "_")
    string.gsub(pattern) { |x| [escape_character, x].join }
  end
end
