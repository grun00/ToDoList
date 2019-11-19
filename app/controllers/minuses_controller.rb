class MinusesController < ApplicationController 
  before_action :find_comment, :find_task, only: %i[create destroy]


  def create 
    if minused?
      Minuse.where(comment: @comment)[0].destroy
      @comment.update(score: (@comment.score + 1))
      flash[:notice] = 'Comment Unminused'
    else 
      @minus = Minuse.create(user: current_user, comment: @comment)
      if @comment.pluses.any?
        @comment.pluses.where(user: current_user)[0].destroy
      end
      if @minus.save
        @comment.update(score: (@comment.score - 1))
        flash[:notice] = 'Comment Minused'
      else
        flash[:alert] = 'Error in minussing' 
      end
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

end

