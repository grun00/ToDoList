class PlusesController < ApplicationController 
  before_action :find_comment, :find_task, only: %i[create]


  def create 
    if !plused?
      @plus = Pluse.create(user: current_user, comment: @comment)
      if @plus.save
        flash[:notice] = 'Comment Plused'
      else
        flash[:alert] = 'Error in Plussing' 
      end
    else
      Pluse.where(comment: @comment)[0].destroy
      flash[:notice] = 'Comment Unplused'
    end
    redirect_to task_path(@task)
  end

  private 

  def find_comment
    @comment = Comment.find(params[:comment_id])
  end

  def find_task
    @task = Task.find(params[:task_id])
  end

  def plused?
    Pluse.where(user: current_user, comment: @comment).exists?
  end
end

