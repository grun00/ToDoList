class CommentsController < ApplicationController
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

  def plus_comment
    Like.create(user: current_user, comment: Comment.find(params[:comment_id]))
  end
end
