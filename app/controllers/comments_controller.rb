class CommentsController < ApplicationController


  before_action :authenticate_user!, :except => [:index]
  load_and_authorize_resource

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    CommentMailer.publish_comment_email(@article.user_id,current_user).deliver
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :user_id)
    end
end