class CommentsController < ApplicationController
  def index
    @comments = Comment.where(user: current_user)
  end
end
