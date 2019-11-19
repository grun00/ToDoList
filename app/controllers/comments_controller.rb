class CommentsController < ApplicationController
  before_action :comment_owner?

  def index
    @comments = Comment.where(user: current_user)
    if params[:order].in? %w[new old]
      case params[:order]
      when 'new'
        @comments.order!(created_at: :desc)
      when 'old'
        @comments.order!(:created_at)
      end
    end
  end 

  private 
    
  def comment_owner?
    if !current_user
      redirect_to root_path
    end
  end
end

