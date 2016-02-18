class CommentsController < ApplicationController
  def index
    @comments = Comment.hash_tree
  end

  def new
    @comment = Comment.new(parent_id: params[:parent_id])
    @comment.user_id = current_user.id if current_user || nil
  end

  def create
    if params[:comment][:parent_id].to_i > 0
      parent = Comment.find_by_id(params[:comment].delete(:parent_id))
      @comment = parent.children.build(comment_params)
      @comment.user_id = current_user.id if current_user || nil
    else
      @comment = Comment.new(comment_params)
      @comment.user_id = current_user.id if current_user || nil
    end

    if @comment.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
