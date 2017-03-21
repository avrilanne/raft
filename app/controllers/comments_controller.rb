class CommentsController < ApplicationController


  def new
    @comment = Comment.new
  end

  def create
    p "HELLO NO HELLO NO YES"
    p params
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if params.has_key?(:group_id)
      @comment.commentable_type = 'Group'
      @comment.commentable_id = params[:group_id]
    elsif params.has_key?(:event_id)
      @comment.commentable_type = 'Event'
      @comment.commentable_id = params[:event_id]
    end
    @comment.save
    p "PRINTING COMMENT OBJECT YES I AM!"
    p @comment
    redirect_to :back
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
